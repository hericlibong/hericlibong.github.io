# Scraping the Fifa men's ranking with Scrapy and the hidden API


After the publication of the latest FIFA ranking on April 6th, I visited the association’s website to examine their procedures and potentially obtain the historical ranking since its creation in 1992. While I had access to their procedures, I could not find any public API or an easy way to download the data from their tables. Consequently, I decided to collect the data myself.<br>
### Find Hidden API

When it comes to extracting data from a dynamic website, my first approach is to search for a hidden API. Not only does this allow me to avoid getting blocked, but it also enables me to quickly obtain structured data without relying on long and complex code. Although not all sites have a hidden API, finding one that allows access to the data can greatly simplify the task.<br>
<br>

So, I immediately opened the browser inspector and… Bingo! After refreshing the page, I found an API URL in the XHR tab, which returns the complete current ranking data in a [JSON format list](https://www.fifa.com/api/ranking-overview?locale=en&dateId=id13974).



{{< image src="/images/fifa1.webp" >}}

If we perform the same process by selecting a different date from the drop-down menu, we observe that the page consistently returns the same type of data. Our objective, therefore, will be to retrieve all of these pages. But for now, let’s focus on how to retrieve the latest ranking data using Scrapy.

### Get data with Scrapy

have chosen to use Scrapy because it is my preferred scraping library and it provides a powerful and flexible framework for web scraping tasks. For this project, it can be used outside of its environment, from a simple file, but to speed up the process, we will create a Scrapy project with the default template spider package :

```shell
pip install scrapy
```

```shell
scrapy startproject <projectname>

```
<br>
In the spider folder :
<br>

```shell
scrapy genspider <filename> <site.com>

```
<br>

The first objective is to extract the data from the HTTP response and return it as a list, as we see it on the API endpoint link. Since the URL returns JSON data, we need to:

- Import the json library
- Enter the correct domain name: fifa.com
- Enter the endpoint URL into the starts_url variable
- In the parse function, load the content of the HTTP response into the data variable as a Python dictionary
- Loop through the rankings of all teams and return the data.

<br>

```python
import scrapy
import json  #The URL returns data in JSON format.


class MenrankingSpider(scrapy.Spider):
    name = 'menranking'
    allowed_domains = ['fifa.com']
    start_urls = ['https://www.fifa.com/api/ranking-overview?locale=en&dateId=id13974']

    def parse(self, response):
        data = json.loads(response.body) #loads the contents of the HTTP response into the `data` variable as a Python dictionary.
        for ranking_data in data['rankings']:
            yield ranking_data
```

<br>

In the terminal

```shell
scrapy runspider filename.py
```
<br>

The code instantly returns all the data from the endpoint.


{{< image src="/images/fifa2.webp" >}}

From there, we can select the data we want to keep for exporting in different formats. For me, I only need:

- the country name of the team
- the total points
- the previous points
- the rank
- the previous rank
- the flag link
- the country URL
- the confederation.

<br>

```python
import scrapy
import json  #The URL returns data in JSON format.

class MenrankingSpider(scrapy.Spider):
    name = 'menranking'
    allowed_domains = ['fifa.com']
    start_urls = ['https://www.fifa.com/api/ranking-overview?locale=en&dateId=id13974']

    def parse(self, response):
        data = json.loads(response.body) #loads the contents of the HTTP response into the `data` variable as a Python dictionary.
        base_url = 'https://www.fifa.com'
        for ranking_data in data['rankings']:
            yield {
                'country': ranking_data['rankingItem']['name'],
                'rank': ranking_data['rankingItem']['rank'],
                'previousRank' : ranking_data['rankingItem']['previousRank'],
                'totalPoints': ranking_data['rankingItem']['totalPoints'],
                'previousPoints': ranking_data['previousPoints'],
                'flagUrl': ranking_data['rankingItem']['flag']['src'],
                'countryUrl': base_url + ranking_data['rankingItem']['countryURL'],
                'conf': ranking_data['tag']['text'] 
            }

```

<br>
Again, the data is returned instantly. However, we notice that we do not have the publication date of the ranking. We will see later how to fix this.
<br>

### Get all data from all pages

The main challenge when extracting data from a hidden API is to find the keys that allow you to navigate from one page to another. These are usually found in the metadata, at the beginning or sometimes at the end of the list of data returned by the endpoint, and vary depending on the API.

It can be a page number, the total number of pages, an ID number, or even a boolean indicating that there is a next page.

The issue here is that there are no metadata available. Moreover, as we mentioned earlier, no date is specified. Thus, at first glance, we do not have a key that links the ranking dates to the IDs, and hence to the different data pages.

My solution — there may be others — consisted of examining the page’s source code. In the middle of the code, it was found that the corresponding dates and identifiers were all a list of dictionaries containing a key-value pair with “id” for the ID number, and “text” for the date.


```python
"dates":[{"id":"id13974","text":"6 Apr 2023"},{"id":"id13869","text":"22 Dec 2022"}...{"id":"id2","text":"8 Aug 1993"},{"id":"id1","text":"31 Dec 1992"}]
```  
<br>

We just need to extract this list, turn it into a JSON content, and write a function to send it to the API URL. We can first test this by writing the function in a separate file, for example: test.py.

```python
import scrapy
import json

class MySpider(scrapy.Spider):
    name = 'myspider'
    start_urls = ['https://www.fifa.com/fifa-world-ranking/men?dateId=id13974']

    def parse(self, response):
        #extracts content of the first script tag in the response that contains the string `"dates"` with all the json content of the page.
        script_content = response.xpath('//script[contains(., "dates")]/text()').extract_first()
        #transform it into a Python dictionary
        date_list = json.loads(script_content)
        #extract the list of dates from the dictionary
        date_list = date_list['props']['pageProps']['pageData']['ranking']['dates']
        
        print(date_list)

```

```shell

scrapy runspider test.py

```


{{< image src="/images/fifa3.webp" >}}


In order to extract the list of dates, I used [json formatter](https://jsonformatter.curiousconcept.com/#), a free online tool that makes it easy to quickly identify the correct keys. Simply copy and paste the entire JSON content into the window and click the “Process” button.”



![jsonformarterpicture](images/jsonformatter.png)


We can now integrate this function and modify our code to retrieve all API pages and therefore all FIFA rankings since its creation in 1992. Let’s proceed step by step:

- Import datetime module, which will be used in later steps to work with the date format in the page's source code.
- Change the starting URL to the current men’s ranking page, which will be used to extract the date and ID information needed to scrape all rankings data (Note that we can choose any page because the data we are interested in is the dates and the identification number of the source code).

```python
import scrapy
import json
from datetime import datetime


class MenrankingSpider(scrapy.Spider):
    name = 'menranking'
    allowed_domains = ['fifa.com']
    # changing the starting url by using the one of the ranking page and not the one of the API
    start_urls = ['https://www.fifa.com/fifa-world-ranking/men?dateId=id13974']

```

- Add our method for extracting the list of dates and code source IDs to the parse function
- Create a loop with the list of dates and IDs by iterating over the API URL.
- Format the date as ‘yyyy-mm-dd’.
- Send the request with the date as a parameter.

```python
def parse(self, response):
        script_content = response.xpath('//script[contains(., "dates")]/text()').extract_first()
        date_list = json.loads(script_content)
        date_list = date_list['props']['pageProps']['pageData']['ranking']['dates']
        for item_id in date_list:
            url = f"https://www.fifa.com/api/ranking-overview?locale=en&dateId={item_id['id']}"
            date_text = item_id['text'].replace('Sept', 'sep') # Set the date to the correct format
            date_obj = datetime.strptime(date_text, '%d %b %Y')
            date = date_obj.strftime('%Y-%m-%d')
            yield scrapy.Request(url=url, callback=self.parse_ranking_data, meta={'url': url,'date': date})
```

Finally, we create a new function parse_ranking_data which is a modified version of the initial parse function, with the addition of the date as metadata for each request.

```python
def parse_ranking_data(self, response):
        data = json.loads(response.body) 
        base_url = 'https://www.fifa.com'
        for ranking_data in data['rankings']:
            yield {
                'date': response.meta['date'],
                'country': ranking_data['rankingItem']['name'],
                'rank': ranking_data['rankingItem']['rank'],
                'previousRank' : ranking_data['rankingItem']['previousRank'],
                'totalPoints': ranking_data['rankingItem']['totalPoints'],
                'previousPoints': ranking_data['previousPoints'],
                'flagUrl': ranking_data['rankingItem']['flag']['src'],
                'countryUrl': base_url + ranking_data['rankingItem']['countryURL'],
                'conf': ranking_data['tag']['text'] 
            }
```

<br>

Now, we can use scrapy’s export functions to get the data in a json file.


```shell
scrapy runspider filename.py -o data.json
```

or in csv


```shell
scrapy runspider filename.py -o data.csv
```
<br>

And 20 secondes later

{{< image src="/images/fifa4.webp" >}}

<br>

In conclusion, fetching data through a hidden API can be a convenient, efficient, and fast way to extract data. However, it’s important to note that each API is unique and can have its own quirks and drawbacks. As our example of retrieving data from the FIFA ranking shows, it is necessary to adapt to each API, and not to neglect any track in order to make the most of it and obtain the desired data.

full code [here](https://github.com/hericlibong/FifaRankingScraper/blob/main/historicalmenranking/historicalmenranking/spiders/menranking.py)







