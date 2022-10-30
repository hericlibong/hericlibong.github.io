# Visualiser la 'Variole du singe' avec DataPane # Partie I 

---

## Visualiser avec python c'est bien mais... <br>

Au départ, Il s'agissait juste d'écrire un article sur l'épidémie de la Variole du Singe illustré de quelques visualisations réalisées avec la librairie graphique Python, Plotly. Mais quand il a fallu intégrer mes graphiques interactifs à mon article, j'ai rencontré tout un tas de problèmes. Des problèmes de droits d'accès ou de dépassement de taille avec [studiolab](). Des problèmes pratiques, de responsivité en utilisant les méthodes d'hébergement alternatives. <br>

Je savais que les librairies graphiques `Python` étaient aussi robustes et efficaces que difficiles à intégrer et à partager. Mais là  j'étais à deux doigts de jeter l'éponge et de me tourner vers des solutions Java Script "prêtes à visualiser" du type [Flourish]() ou [Datawarper](). <br>  

<div style="text-align:center;"><iframe src="https://giphy.com/embed/GobVQOj6KdCsE" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/show-boss-let-GobVQOj6KdCsE"></a></p><br>

Et puis je me suis souvenu de [DataPane](). C'est une librairie que j'avais déjà utilisé pour intégrer des visualisations. A l'époque, elle ne m'avait pas laissé un souvenir très marquant. Mais dans la situation actuelle, j'ai jugé bon d'y regarder de plus près.<br>

[Datapane](https://docs.datapane.com/concepts/datapane-teams/) c'est à la fois une librairie Python qui permet de créer des rapports interactifs et  une plateforme [Open] qui permet de les stocker, de les partager via et sur de nombreux supports. <br>

On peut y intégrer directement des objets python, qu'il s'agisse de texte markdown, des graphiques - [Plotly](https://plotly.com/python/), [Altair](https://altair-viz.github.io/#), [Bokeh](https://bokeh.org/), Matplotlib etc. -, de html, de tables ou des médias. 
<br>

A mon sens, Datapane est un outil particulièrement attractif pour plusieurs raisons
- D'abord les rapports peuvent être programmés directement à partir d'un environnement local et unique (Jupyter Notebook, Colab, Airflow etc.).
- Ensuite, la flexibilité de la structure et la simplicité de la syntaxe laissent une grande place à l'intuition. Et permettent à Datapane de répondre à de nombreux besoins. On peut aussi bien utiliser DataPane pour partager une simple visualisation programmée sur Notebook, pour créer un tableau de bord ou pour réaliser et déployer une application complexe.
- Enfin, la facilité pour partager ou pour intégrer les rapports sur des pages web sur des applications communautaires du type `Slack`  ou `discord`. 
    

<br>

Du coup, plutôt que de faire un simple article qui intégrerait quelques visualisations, j'ai décidé de faire un rapport interactif de plusieurs pages.
<br>

[La variole du singe ou MonkeyPox](https://en.wikipedia.org/wiki/Monkeypox) qui se propage actuellement dans le monde de façon m'a semblé être un sujet intéressant.  D'abord, c'est une actualité sanitaire qui nous concerne tous. Ensuite, les données étant régulièrement actualisées, nous pourrons créer un rapport interactif régulièrement mis à jour. 


<br>

<div style = "text-align:center; width:25%px">

![money1](/images/funny1.gif)

</div>
<br>



{{< admonition type=info title="Sur les données utilisées" open=false >}}

Les données proviennent de l'association [GlobalHealth](https://github.com/globaldothealth/monkeypox) qui suit l'évolution de la propagation de la  maladie depuis l'apparition des premiers cas.

A des fins personnelles j'y ai ajouté quelques variables, `"Continents"`, `"SubRegion"`, les coordonnées géographiques, `"latitude"`, `"longitude"` et les décès, `deaths`. (lien du fichier)

{{< /admonition >}}

---

<br>

## Le détail du travail

Nous allons faire un rapport de quatre pages : 
- 1 page d'accueil qui contiendra du texte markdown et affichera les principales statistiques
- 1 page de charts avec différents graphiques interactifs et comparatifs
- 1 page pour la carte
- 1 page de tables
  

<br>

Cette première pratique sera essentiellement consacrée à la page d’introduction. Ce qui nous permettra également de présenter la structure générale de DataPane que nous rencontrerons tout au long de la programmation du rapport.




{{< admonition type=abstract title="MonkeyPox DataExplorer" open=true >}}

<iframe src="https://datapane.com/reports/j3L1gq7/monkeypox-rapport/embed/" width="100%" height="540px" style="border: none;">IFrame not supported</iframe>

{{< /admonition >}}

## Installation et datas

si ce n'est pas déjà fait la première chose est [d'installer Datapane](https://docs.datapane.com/tutorials/basics/install-datapane/) et de l'importer

```bash
pip3 install datapane

```

et de l'importer avec les librairies dont nous aurons besoin

```python
import pandas as pd
import datapane as dp

import plotly.graph_objs as go
import plotly.express as px

df = pd.read_csv('newmonkeyset.csv')
df
```
:arrow_heading_down:

{{< admonition type=tip title="Lire le dataframe avec DataTable de Datapane " open=false  >}} 

Le dataset est une timeserie des cas de MonkeyPox déclarés depuis le mois de janvier 2002 jusqu'à présent. Bien que l'on ait recommencé à évoquer la maladie à l'apparition des premiers cas en Europe, il inclût également les cas déclarés antérieurement en Afrique dans les pays où la maladie est endémique. 

En passant notre jeu de données dans le bloc  [DataTable](https://docs.datapane.com/tutorials/blocks/tables-and-data/#table:~:text=flatten%20your%20data.-,DataTable,-The%20DataTable%20block) nous pouvons déjà charger et partager un premier  `Report`. Ce qui permettra à notre interlocuteur ou aux lecteurs, de l'explorer, de l'ordonner, de créer des filtres conditionels, de faire des requêtes SQL et de l'importer dans différents formats. Nous pouvons également utiliser le bloc [Table](https://docs.datapane.com/tutorials/blocks/tables-and-data/#:~:text=to%20interactive%20drilldowns.-,Table,-The%20Table%20component) si nous souhaitons simplement afficher quelques données filtrées. Pour notre box, nous utiliserons les deux.
<br>


```python

#Let's try to load a DataTable 
table = dp.DataTable(df)
report = dp.Report(table)
report.upload(name="datapox")

```
<br>

<iframe src="https://datapane.com/reports/n3RKQl7/datapox/embed/" width="100%" height="540px" style="border: none;">IFrame not supported</iframe>

{{< /admonition >}}



### Page d'Accueil

Dans Datapane les rapports sont composés de plusieurs blocs, qui englobent des objets Python, comme  nous l'avons signalé plus haut. Ces blocs - de texte ou de données - peuvent être eux mêmes englobés dans d'autres blocs de mise en page.<br>

La première page est composée d'une liste de 3 éléments blocs :
- 1 bannière que nous passerons dans le bloc Html
- 1 bloc texte de présentation au format markdown dans lequel nous passerons les variables de données statistiques
- 1  groupe de 3 cartes BigNumber pour mettre en évidence les données principales de l'épidémie

Le tout englobé dans des blocs de mise en page, dp.Group(), calés sur 2 colonnes.

Ce qui nous donnera la structure de base suivante : 

<br>

```python

dp.Report(
    dp.Page(title = 'intro', 
        blocks = [
        dp.HTML(),#html banner image
        dp.Group(
            dp.Group(
                #text title
                dp.text()# full markdown text
                ),
            dp.Group(
                dp.BigNumber(),#Global cases + indicators
                dp.BigNumber(),# Deaths
                dp.BigNumber(),#Countries affected number
                dp.BigNumber()#Last entries Country
                ), 
                columns = 2)
    ]
    ), 
    dp.Page(title = 'Monkey Pox in Charts'),
    dp.Page(title = 'Animated Map'),
    dp.Page(title = 'data')
)

```

<br>
Mais avant de nous intéresser à la structure du rapport, nous devons créer nos objets et préparer nos données.

<br>

###### La bannière

Pour la bannière, c'est bien simple, on créé une variable `html_banner` avec du `html` que l'on va passer dans le bloc `dp.Html()` :monkey_face:
<br>


```python

html_banner = """<div style="padding: 10px;display: flex;align-items: center;font-size: 40px;color: #312E81;background: #EEF2FF;">
<img src="https://axtell.com/wp-content/uploads/2020/06/monkey34.jpg" style="margin-right: 1em; max-height: 250px;">
<h1>MonkyPox Data Explorer</h1>
</div>
"""
```
<br>

###### Texte Intro

On peut utiliser du markdown pour le passer dans le bloc text `dp.Text()`. Ici, j'ai souhaité que notre texte de présentation contienne des données actualisées en temps réel. Par ex: le nombre total de cas, le pays le plus affecté, la moyenne des contaminations par jour etc.




```python

# Set the variables to be included to entry text
df['date_time'] = pd.to_datetime(df['date'], format ='%Y-%m-%d')

#average number of cases per day since the first European cases
df_NE = df.loc[df['date_time'] > '2022-05-01'] 
daily_mean = df_NE.groupby('date')['daily_cases'].sum().reset_index() 
daymean = round(daily_mean.daily_cases.mean(), 2)


# Most affected country name & cases Nb
first_country_name = df.groupby('Country')['cumulative_cases'].max().sort_values(ascending = False).reset_index()['Country'][0]
first_country_nb_cases = df.groupby('Country')['cumulative_cases'].max().sort_values(ascending = False).reset_index()['cumulative_cases'][0]
first_country_nb_cases = '{:,}'.format(first_country_nb_cases)

#Nb Deaths
deaths = df.groupby('date')['cumulative_deaths'].sum().iloc[-1]


#10 most affected countries global cases & percent
top_ten = df.groupby('Country')['cumulative_cases'].max().reset_index().sort_values(by=['cumulative_cases'], ascending = False).head(10)
topten_global = top_ten['cumulative_cases'].sum()
topten_global = '{:,}'.format(topten_global)
topten_percent = round(top_ten['cumulative_cases'].sum()/df['daily_cases'].sum()*100, 2)


# liste_countries  = ['Greenland', 'Honduras', 'Moldova', 'Monaco','Andorra', 'Argentina', 'Australia', 'Austria', 'Barbados', 'Belgium', 'Benin', 'Bermuda', 'Bolivia', 'Bosnia', 'Brazil', 'Bulgaria', 'Cameroon', 'Canada', 'Central African Republic', 'Chile', 'China', 'Colombia', 'Congo', 'Costa Rica', 'Croatia', 'Cyprus', 'Czech Republic', 'Democratic Republic of Congo', 'Denmark', 'Dominican Republic', 'Ecuador', 'Estonia', 'Finland', 'France', 'Georgia', 'Germany', 'Ghana', 'Gibraltar', 'Greece', 'Guadeloupe', 'Guatemala', 'Hungary', 'Iceland', 'India', 'Ireland', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Latvia', 'Lebanon', 'Liberia','Saint Martin (French part)', 'Lithuania', 'Luxembourg', 'Malta', 'Martinique', 'Mexico', 'Montenegro', 'Morocco', 'Netherlands', 'New Caledonia', 'New Zealand', 'Nigeria', 'Norway', 'Panama', 'Peru', 'Philippines', 'Poland', 'Portugal', 'Puerto Rico', 'Qatar', 'Romania', 'Russia', 'Saudi Arabia', 'Serbia', 'Singapore', 'Slovakia', 'Slovenia', 'South Africa', 'South Korea', 'Spain', 'Sudan', 'Sweden', 'Switzerland', 'Taiwan', 'Thailand', 'Turkey', 'United Arab Emirates', 'United Kingdom', 'United States', 'Uruguay', 'Venezuela']
# #last update : 2022-08-16

# new_countries = [i for i in list(df.Country.unique()) if i not in liste_countries ]

# strList = [str(i) for i in new_countries]
# new_countries_str = ",  ".join(strList)
# nb_new_countries = len(new_countries)
# last_updated = df['date'].iloc[-1]

text_md = f"""
**Since May 6, 2022 and the first cases reported** in the United Kingdom by the WHO, the world, 
still in the grip of violent waves of Covid-19, is facing a new epidemic. Monkeypox is spreading in an 
unusual human-to-human fashion around the world.

This is especially true outside **the endemic areas** of Central and West Africa, where the disease made 
its official appearance in 1970. According to data 
published by the [GlobalHealth](https://github.com/globaldothealth/monkeypox) association, an average 
of **{daymean}** cases are recorded every day. To date, there are **{global_cases}** cases worldwide

**{first_country_name}** is the most affected country with ***{first_country_nb_cases}*** confirmed cases. 

However, even though the WHO has declared Monkey Pox a public 
health emergency, there have been 'only'**{deaths}** deaths worldwide to date and **{topten_global}** cases, 
i.e.**{topten_percent}%** of global cases are concentrated in the 10 countries most affected by the epidemic. 
 
{nb_new_countries} last affected countries : **{new_countries_str}**  
  

 Last Update : **{last_updated}**
 

"""
```

<br>

### Cartes BigNumber

...Et les valeurs des blocks BigNumber


```python

#Bignumber data
global_cases = df.groupby('date')['cumulative_cases'].sum().iloc[-1]
global_cases_change = df.groupby('date')['cumulative_cases'].sum().iloc[-1] - df.groupby('date')['cumulative_cases'].sum().iloc[-2]
nb_countries = len(df['Country'].unique())
nb_deaths = df['deaths'].sum()

###### Report ######

dp.Report(
    dp.Page(
        title = "Intro",
        blocks = [
        dp.HTML(banner_html), 
        dp.Group(
             dp.Group(
            '## resume',
            dp.Text(md),
            ),
            dp.Group(
                dp.BigNumber(
                    heading = 'GLOBAL CASES',
                    value='{:,}'.global_cases,
                    change ='{:,}'.global_cases_change),
                    is_upward_change=True,
                
                ),
                dp.BigNumber(
                    heading = 'NUMBER OF COUNTRIES',
                    value = len(data_world['Country'].unique()),
            
                dp.BigNumber(
                    heading = 'DEATHS',
                    value = nb_deaths)
            ), columns =2)
        
        ]
        ),
         dp.Page(title = 'Monkey Pox in Charts'),
         dp.Page(title = 'Animated Map'),
         dp.Page(title = 'data')
)
```



