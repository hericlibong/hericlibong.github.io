---
noteId: "27e0bd92579f11eda7b9b5cb7de83336"
tags: []

---

# Femmes et premier ministre

## Femme 1er ministre? rien d'exeptionnel de nos jours

Dans quelques jours, il est fort probable que le prochain premier ministre d'Italie soit une première ministre. Comme en Angletterre, le 4 septembre dernier et en France il y a 4 mois, une femme sera à la tête d'une Nation majeure de l'Europe occidentale. Il ne s'agit ici pas de commenter ses choix politiques ou de discourir sur le genre. Car heureusement il n'y a rien d'exeeptionnel à cela de nos jours.<br>

Mais cela m'a donné envie de faire un inventaire des femmes ayant occupé cette fonction dans le monde contemporain. De faire des répartitions par âge, par longévité, par continent etc. et de visualiser l'évolution dans le temps.<br>

## Récupérer les données avec Wikidata

Pour la collecte les données, j'ai choisi d'utiliser [Wikidata](https://www.wikidata.org/wiki/Wikidata:Introduction/fr) et de lancer une requête Sparql. 


{{< admonition type=note title="A propos de Wikidata et du Sparql" open=false >}}

Pour rappel,  Wikidata est une base de connaissance libre, collaborative et multilingue qui collecte des données structurées pour alimenter Wikipédia et l'ensemble des projets [Wikimedia](https://www.wikidata.org/wiki/Help:Wikimedia).<br>






{{< /admonition >}}

Tester la requête wikidata :

- https://w.wiki/5kDx


<iframe style="width: 700px; height: 400px; border: none;" src="https://query.wikidata.org/embed.html#%20SELECT%20DISTINCT%20%3FitemLabel%20%3FpositionLabel%20%3Fdate_start%20%3Fdate_end%20%3FnationalityLabel%20%3FbornplaceLabel%20%3Fgeocoord%20%3Fimage%0A%0AWHERE%20%0A%7B%0A%20%3Fitem%20wdt%3AP31%20wd%3AQ5%3B%0A%20%20%20%20%20%20%20wdt%3AP21%20wd%3AQ6581072%3B%0A%20%20%20%20%20%20%20p%3AP39%20%3Fstatement.%0A%0A%20%3Fstatement%20ps%3AP39%20%3Fposition%3B%0A%20%20%20%20%20%20%20%20%20%20%20%20pq%3AP580%20%3Fdate_start.%0A%20OPTIONAL%20%7B%3Fstatement%20pq%3AP582%20%3Fdate_end.%7D%0A%0A%0A%20%3Fposition%20wdt%3AP279%20wd%3AQ14212.%0A%20%20%0A%20%20%3Fitem%20wdt%3AP19%20%3Fbornplace%3B%0A%20%20%20%20%20%20%20wdt%3AP27%20%3Fnationality.%0A%20%20OPTIONAL%20%7B%3Fbornplace%20wdt%3AP625%20%3Fgeocoord.%7D%0A%20%20OPTIONAL%20%7B%3Fitem%20wdt%3AP18%20%3Fimage.%7D%0A%20%20%20%0A%20%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22%5BAUTO_LANGUAGE%5D%2Cen%22.%20%7D%0A%7D" referrerpolicy="origin" sandbox="allow-scripts allow-same-origin allow-popups" ></iframe>


<div class="flourish-embed flourish-hierarchy" data-src="visualisation/11348054"><script src="https://public.flourish.studio/resources/embed.js"></script></div>

https://observablehq.com/d/99a92633fe5d5149



