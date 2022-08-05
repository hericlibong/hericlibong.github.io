# Le MonkeyPox avec Jupyter Notebook, PLotly et DataPane 


___

###### Réaliser, partager et intégrer son data visualizer en python <br>


Quand je me suis lancé dans la science des données poour agrémenter mes récits de faits... mais  surtout j'étais particlièrement admiratif devant la puissance narrative des visualisations interactives, de la liberté de lecture qu'elles offrent aux lecteurs. <br> Par contre, après une première formation en `Python`, j'ai été quelque peu déçu par la pauvreté narrative des librairies graphiques communes à ce language. Elles sont puissantes et efficaces mais la plupart restent très orientées sciences des données. Elles ne sont pas toujours très accessibles. <br> <br> Dans tous les cas, pas très ludiques. Du coup, on est facilement tenté de se tourner vers dess solutions tels que `D3js` ou encore des applications "prêt-à-visualiser" tel que DataWarper ou [Flourish](https://app.flourish.studio/login).

<br>

<div style="text-align:center;"><iframe src="https://giphy.com/embed/GobVQOj6KdCsE" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/show-boss-let-GobVQOj6KdCsE"></a></p><br>

###### Datapane une bonne alternative en total python <br>
<br>




En fait si. ....

DataPane est celle que je trouve vraiment intéressante en matière de qualité temps. elle peut  être  le  support d'applications complexes auussi bien que de simples visualisations. Son  code python  intégré  permet de 

De plus, comme nous le verrons  DataPane est très simple à partager et à intégrer.  Ce  qui n'est pas toujours de la plupart des autres librairies  graphiques python

l'application s'intégre à votre environnemennt notebook et permeet de générer des rapport directement à partir de cet environnement. Et surtoot  datapane est flexible à la fois par l'utilisation que l'on  veut en  faire, pour les environnemennts qu'elle peuuut intégrer.<br>

<br>

<div style = "text-align:center; width:25%px">

![money1](/images/funny1.gif)

</div>

###### Notre mission

L'idée n'est pas de reproduire l'intégralité du notebook

si ce n'est pas déjà fait la première chose est d'installer Datapane et de l'importer



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











<iframe src="https://datapane.com/reports/E7ydRP3/monkeypox2/embed/" width="100%" height="540px" style="border: none;">IFrame not supported</iframe>

{{< version 0.2.11 changed >}}

testons :

{{< admonition tip >}}
**LoveIt** theme has [special shortcode for image](../theme-documentation-extended-shortcodes#image), which provides more features.
{{< /admonition >}}

<i class="fa-duotone fa-chart-simple"></i>





