param (
    [string]$title = $(Read-Host -Prompt "Enter the title of the post"),
    [string]$categories = "blog"
)

# Date actuelle
$date = Get-Date

# Remplace les espaces dans le titre par des tirets et supprime les caractères non autorisés
$fileTitle = $title -replace ' ', '-' -replace '[^a-zA-Z0-9-]', ''

# Supprime les tirets au début du nom de fichier
$fileTitle = $fileTitle.TrimStart('-')

# Crée le nom du fichier avec la date actuelle et le titre
#$fileName = "$($date.ToString('yyyy-MM-dd'))-$fileTitle.md"
$fileName = $date.ToString("yyyy-MM-dd") + "-" + $fileTitle + ".md"


# Chemin du dossier _posts
$postsPath = Join-Path -Path (Get-Location) -ChildPath "_posts"

# Crée le dossier _posts s'il n'existe pas
if (-Not (Test-Path -Path $postsPath)) {
    New-Item -Path $postsPath -ItemType Directory
}

# Chemin complet du fichier
$filePath = Join-Path -Path $postsPath -ChildPath $fileName

# Contenu du fichier de post
$content = @"
---
layout: post
title: "$title"
date: $($date.ToString("yyyy-MM-dd HH:mm:ss")) +0000
categories: $categories
---

# $title

This is the content of my new post. I'm excited to share more about my journey as a developer.
"@

# Crée le fichier et ajoute le contenu
Set-Content -Path $filePath -Value $content

Write-Output "New post created: $filePath"
