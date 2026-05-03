param(
    [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
    [string[]]$TitleParts
)

$ErrorActionPreference = "Stop"

$Title = ($TitleParts -join " ").Trim()

if ([string]::IsNullOrWhiteSpace($Title)) {
    Write-Error "Vous devez fournir un titre pour le mini-cours."
    exit 1
}

function Convert-ToSlug {
    param([string]$Text)

    $normalized = $Text.Normalize([Text.NormalizationForm]::FormD)
    $builder = New-Object System.Text.StringBuilder

    foreach ($char in $normalized.ToCharArray()) {
        $category = [Globalization.CharUnicodeInfo]::GetUnicodeCategory($char)
        if ($category -ne [Globalization.UnicodeCategory]::NonSpacingMark) {
            [void]$builder.Append($char)
        }
    }

    $slug = $builder.ToString().Normalize([Text.NormalizationForm]::FormC).ToLowerInvariant()
    $slug = $slug -replace "[^a-z0-9]+", "-"
    $slug = $slug -replace "^-+|-+$", ""
    return $slug
}

$RepoRoot = Split-Path -Parent $PSScriptRoot
$TemplatePath = Join-Path $RepoRoot "_templates\new_formation_module.md"
$TargetDir = Join-Path $RepoRoot "_formation_ia"
$Date = Get-Date -Format "yyyy-MM-dd"
$DateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss zzz"
$Slug = Convert-ToSlug $Title
$TargetPath = Join-Path $TargetDir "$Date-$Slug.md"

if (-not (Test-Path $TemplatePath)) {
    Write-Error "Template introuvable : $TemplatePath"
    exit 1
}

if (Test-Path $TargetPath) {
    Write-Error "Le fichier existe deja : $TargetPath"
    exit 1
}

$Content = Get-Content -LiteralPath $TemplatePath -Raw -Encoding UTF8
$Content = $Content.Replace("{{ title }}", $Title)
$Content = $Content.Replace("{{ slug }}", $Slug)
$Content = $Content.Replace("{{ date_slug }}", $Date)
$Content = $Content.Replace('date: ""', "date: `"$DateTime`"")

$Utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($TargetPath, $Content, $Utf8NoBom)

Write-Host "Nouveau mini-cours Formation IA cree : _formation_ia/$Date-$Slug.md"
Write-Host "URL locale apres regeneration Jekyll : /formation-ia/mini-cours/$Date-$Slug/"
