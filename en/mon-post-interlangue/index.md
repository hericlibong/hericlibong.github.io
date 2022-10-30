# Explore MonkeyPox Data with Jupyter Notebook, Plotly and Datapane #Part I


## Visualizing with python is good but... <br>

 At the beginning, I just wanted to write an article about the Monkey Pox epidemic illustrated with some visualizations made with the Python graphics library, Plotly. But when I had to integrate my interactive graphics to my article, I encountered a lot of problems. Problems of access rights or size overflow with [studiolab](). Practical problems, responsiveness when using alternative hosting methods <br>

I knew that `Python` graphics libraries were robust and efficient, but I also knew that they were not always very convenient to integrate into web pages and to share. I was about to give up and turn to "ready to view" Java Script solutions like [Flourish]() or [Datawarper](). <br>  

<div style="text-align:center;"><iframe src="https://giphy.com/embed/GobVQOj6KdCsE" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/show-boss-let-GobVQOj6KdCsE"></a></p><br>


And then I remembered [DataPane](). It's a library I had already used to integrate visualizations. At that time, it didn't leave me a very strong memory. But in the current situation, I thought it would be a good idea to take a closer look. <br>

You can directly integrate python objects, be it markdown text, graphics - [Plotly](https://plotly.com/python/), [Altair](https://altair-viz.github.io/#), [Bokeh](https://bokeh.org/), Matplotlib etc. -html, tables or media. 

<br>

In my opinion, Datapane is a particularly attractive tool for several reasons
- First, the reports can be programmed directly from a single local environment (Jupyter Notebook, Colab, Airflow etc.)
- Second, the flexibility of the structure and the simplicity of the syntax leave a lot of room for intuition. This allows Datapane to meet many needs. You can use DataPane to share a simple visualization programmed on Notebook, to create a dashboard or to build and deploy a complex application.
- Finally, the ease of sharing or integrating reports on web pages on community applications such as `Slack` or `discord`. 


<br>

So, instead of writing an article that would include some visualizations, I decided to make an interactive report of several pages.
<br>

[Monkeypox](https://en.wikipedia.org/wiki/Monkeypox) which is currently spreading around the world in a way that seemed to me to be an interesting subject.  First, it is a health news that concerns us all. Secondly, since the data is regularly updated, we will be able to create an interactive report that is regularly updated. 

<br>

<div style = "text-align:center; width:25%px">

![money1](/images/funny1.gif)

</div>
<br>


{{< admonition type=info title="About the data" open=false >}}

The data come from the association [GlobalHealth](https://github.com/globaldothealth/monkeypox) which follows the evolution of the spread of the disease since the first cases appeared.

For personal use I have added some variables, `Continents`, `SubRegion`, geographic coordinates, `latitude`, `longitude` and deaths, `deaths`. (link to the file)

{{< /admonition >}}

---

<br>

## Details of Work

We are going to make a four page report: 
- 1 home page that will contain markdown text and display the main statistics
- 1 page of charts with different interactive and comparative graphs
- 1 page for the map
- 1 page of tables

<br>


This first practice will be mainly devoted to the introduction page. This will also allow us to present the general structure of DataPane that we will encounter throughout the programming of the report.




{{< admonition type=abstract title="MonkeyPox DataExplorer" open=true >}}

<iframe src="https://datapane.com/reports/j3L1gq7/monkeypox-rapport/embed/" width="100%" height="540px" style="border: none;">IFrame not supported</iframe>

{{< /admonition >}}

## Installation and datas

if you haven't already done so, the first thing is to [install Datapane](https://docs.datapane.com/tutorials/basics/install-datapane/) and import it

```bash
pip3 install datapane

```

and import it with the libraries we will need

```python
import pandas as pd
import datapane as dp

import plotly.graph_objs as go
import plotly.express as px

df = pd.read_csv('newmonkeyset.csv')
df
```
:arrow_heading_down:

{{< admonition type=tip title="Read the dataframe with DataTable from Datapane" open=false  >}} 

The dataset is a timeseries of MonkeyPox cases reported from January 2002 to the present. Although the disease started to be mentioned again when the first cases appeared in Europe, it also includes cases reported earlier in Africa in countries where the disease is endemic. 

By passing our dataset in the block [DataTable](https://docs.datapane.com/tutorials/blocks/tables-and-data/#table:~:text=flatten%20your%20data.-,DataTable,-The%20DataTable%20block) we can already load and share a first `Report`. This will allow our interlocutor or readers to explore it, to order it, to create conditional filters, to make SQL queries and to import it in different formats. We can also use the block [Table](https://docs.datapane.com/tutorials/blocks/tables-and-data/#:~:text=to%20interactive%20drilldowns.-,Table,-The%20Table%20component) if we just want to display some filtered data. For our box, we will use both.


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



## Home Page

In Datapane reports are composed of several blocks, which enclose Python objects, as mentioned above. These blocks - of text or data - can themselves be embedded in other layout blocks.<br>

The first page is composed of a list of 3 block elements:
- 1 banner that we will pass in the Html block
- 1 text block in markdown format in which we will pass the statistical data variables
- 1 group of 3 BigNumber cards to highlight the main data of the epidemic

The whole thing is wrapped in layout blocks, dp.Group(), set on 2 columns.

This will give us the following structure:

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

But before we look at the structure of the report, we need to create our objects and prepare our data.

<br>

### Banner

For the banner, it's very simple, we create a variable `html_banner` with `html` that we will pass in the block `dp.Html()`:monkey_face: 
<br>


```python

html_banner = """<div style="padding: 10px;display: flex;align-items: center;font-size: 40px;color: #312E81;background: #EEF2FF;">
<img src="https://axtell.com/wp-content/uploads/2020/06/monkey34.jpg" style="margin-right: 1em; max-height: 250px;">
<h1>MonkyPox Data Explorer</h1>
</div>
"""
```
<br>

### Intro Text

We can use markdown to pass it in the text block `dp.Text()`. Here, I wanted our presentation text to contain real time updated data. For example: the total number of cases, the most affected country, the average number of infections per day etc.




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

### BigNumber Blocks

...And the values of the BigNumber blocks

```python

# Set the global value for big Number Cards
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


