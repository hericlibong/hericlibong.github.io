# Visualiser la 'Variole du singe' avec DataPane 


___

###### Visualiser avec python?... Pas toujours evident <br>


Quand je me suis lancé dans la science des données poour agrémenter mes récits de faits... mais  surtout j'étais particlièrement admiratif devant la puissance narrative des visualisations interactives, de la liberté de lecture qu'elles offrent aux lecteurs. <br> Par contre, après une première formation en `Python`, j'ai été quelque peu déçu par la pauvreté narrative des librairies graphiques communes à ce language. Elles sont puissantes, robustes et efficaces pour une utilisiation en datascience ou en data-analyse, mais d'un point de vue story-telling elles ne sont pas très attractives et souvent très compliqué à partager ou à intégrer à diverses supports. <br> 
<br>

<div style="text-align:center;"><iframe src="https://giphy.com/embed/GobVQOj6KdCsE" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/show-boss-let-GobVQOj6KdCsE"></a></p><br>

###### Datapane une bonne alternative en total python <br>
<br>




En fait si. ....

DataPane est celle que je trouve vraiment intéressante en matière de qualité temps. elle peut  être  le  support d'applications complexes auussi bien que de simples visualisations.

[Datapane est une  librairie python](https://docs.datapane.com/concepts/datapane-teams/) qui permet de construire des rapports interactifs  et de les partager sur de nombreux supports. En général, il s'agit de rapports scientifiques,  de data analyse ou de datascience. Donc, au  départ on pourrait penser qu'elle n'est pas adaptée aux récits  journalistiques. Et pourtant l'application dispose de nombreux atouts qui, à mon sens, la rend tout à fait apte à la narration interactive et à proposer une alternative intéressante à l'écriture linéaire journalistique.  <br>

On peut y mettre du texte, des medias, des charts, des tables, des liens internes ou externes. On peut y intégrer directement les objects python avec lesquels on travaille  - les librairies graphiques, Dataframes pandas, du markdown. On peut programmer intégralement à partir de n'importe quel environnement - Jupyter, Colab, Airflow...  Mais ce qui la rend partilièrement pratique, c'est que la facilté avec laquelle on peut intégrer et partager les rapports sur tous types de supports.
<br>

J'ai choisi de travailler sur [la variole du singe ou MonkeyPox](https://en.wikipedia.org/wiki/Monkeypox) qui se propage un peu partout dans le monde actuellement.  D'abord, c'est une actualité sanitaire qui nous concerne tous. Ensuite, les données sont régulièrement actualisées. Donc on aura une sorte d'infobox ou de DataExplorer toujours à jour actualisé au rythme de l'évolution de l'épidémie. 

<br>

<div style = "text-align:center; width:25%px">

![money1](/images/funny1.gif)

</div>
<br>



{{< admonition note "Note sur les données" >}}

Les données proviennent de l'association [GlobalHealth](https://github.com/globaldothealth/monkeypox) qui l'évolution de la maladie depuis le l'apparition des premiers cas.
- [timeseries-confirmed](https://github.com/globaldothealth/monkeypox/blob/main/timeseries-confirmed.csv) contient les cas globaux
- [timeseries-country-confirmed](https://github.com/globaldothealth/monkeypox/blob/main/timeseries-country-confirmed.csv) contient les données par pays

A des fins personnelles j'y ai ajouté quelques variables, `"Continents"`, `"SubRegion"`, les coordonnées géographiques, `"latitude"`, `"longitude"` et les décès. (lien du fichier)


{{< /admonition >}}
___
<br>





###### Notre mission


Je ne vais reproduire le Jupyter Notebook dans son intégralité. Il est disponible sur ce [repo](). L'idée est juste de présenter la stuctuure de Datapane et de voir commment intégrer nos objects Python à l'intérieur des différents types de [blocks](https://docs.datapane.com/tutorials/blocks/) qui nous sont proposés.<br>
On verra également comment y intégrer quelques éléments de style à partir de la section consacrée.



<iframe src="https://datapane.com/reports/E7ydRP3/monkeypox2/embed/" width="100%" height="540px" style="border: none;">IFrame not supported</iframe>


si ce n'est pas déjà fait la première chose est [d'installer Datapane](https://docs.datapane.com/tutorials/basics/install-datapane/) et de l'importer



```bash
pip3 install -U datapane

```


et de l'importer avec les librairies dont nous aurons besoin





```python
import pandas as pd
import datapane as dp

import plotly.graph_objs as go
import plotly.express as px



url = 'https://raw.githubusercontent.com/globaldothealth/monkeypox/main/timeseries-confirmed.csv'

data = pd.read_csv('newmonkeyset.csv')
data_world = pd.read_csv(url)

```
<br>

L'objectif est de créer un rapport à 5 pages ou Onglets. C'est dans ces pages que nous passerons les différents blocks et ainsi  que les objects que nous aurons choisi. En fait, c'est simple : chaque page contient des groupes,  qui contiennent  - éventuellement - des sous  groupes, qui contiennent, des objets.<br>  

```python

dp.Report(
    dp.Page(title = 'intro'), 
    dp.Page(title = 'Monkey Pox in Charts'),
    dp.Page(title = 'Animated Map'),
    dp.Page(title = 'data')
)
```
<br>
Notre page d'intro sera une page de présentatiion. Une image, du markdown text et les prinicipaux chiffres de la maladie. Nous utiliserons le BigNumber qui peut recevoir des données nuumériques  fonctionne un peu comme un indicateur 
<br>









