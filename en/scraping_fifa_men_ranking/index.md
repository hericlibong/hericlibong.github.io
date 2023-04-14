# Scraping the Fifa men's ranking with Scrapy and the hidden API


Whenever I start to extract data from a dynamic site, my first step is to look for a hidden API. Firstly to avoid blockages and to get structured data quickly. But above all it is to avoid endless and complex codes.<br>
Obviously not all sites have one. But when there is one and it allows access to the data you are looking for, it makes the work much easier.<br>
Already, concerning the Fifa site, I found it abnormal that such an institution does not have a public API for data that requires a certain precision and that concerns everyone.<br>
If you open the browser inspector and go to the XHR tab in the network section you can find a request get status 200, the API link.<br> 
Clicking on https://www.fifa.com/api/ranking-overview?locale=en&dateId=id13974 we can see the table data representing the latest ranking published on 6 April 2023<br>


{{< image src="/images/data3.png" >}}

We can do the same thing for the ranking of another date and we will have the same data return with the corresponding date.<br>
Our goal is, of course, to retrieve data from all pages. But for now, let's see how to parse the data from the last ranking using Scrapy.<br>

### Get data with Scrapy

For this project we can use Scrapy outside its environment, from a single file. But I propose to open a scrapy project and use the whole : <br>

```shell
scrapy startproject <projectname>

```
<br>
Going inside the spider and launch a default template spider  :
<br>

```shell
scrapy genspider <filename> <site.com>

```
<br>

As far as I am concerned, I have named the file : `menranking`.
The goal here is to extract the data from the HTTP response and return it as a list.
The url returns `json` data thus first : 
- We import `json` <br>
Then :
- we enter the correct domain name: fifa.com
- We enter the url of the endpoint in `starts_url`
- In the `parse` function we load the contents of the HTTP response into the `data` variable as a Python dictionary.

<br>

<script src="https://gist.github.com/hericlibong/feade151ff2661a47654f7c7061cc30e.js"></script>

<br>

After launching our spider:

```shell
scrapy runspider filename.py
```
<br>

This code instantly returns the latest ranking data as it is returned from our access point.
As far as I'm concerned, I don't need to retrieve the full data.
I only want to use :  
- The country of the team (name) 
- the total of points
- the rank
- the link of the flag 
- the confederation in which evolves the team

<br>

Get the right key

<br>

<script src="https://gist.github.com/hericlibong/1936af1b5cf5108b875702b021ae6cc0.js"></script>
<br>
However, we note that we do not have the date of publication of the ranking. This absence may cause us problems. We will see later how to solve it.

### Get all data from all pages

The main challenge when extracting hidden API data is to find the `pagination keys`. Usually they are in the metadata at the beginning or sometimes at the end of the list of data returned on the page. They are set up according to internal standards and give indications of dates, page numbers, id numbers etc., but allow to refer to the next page.<br>
The problem is that, in our case, there is no metadata. Furthermore, as noted above, no date is specified. So at first sight, we do not have a key that links the dates of the rankings to the identifiers, thus to the different data pages.<br>
My first thought was to use the urls and create a variable with the IDs. But this would not have allowed us to go very far because the ID numbers do not have a logical sequence.<br>
I then thought of iterating over a large series of id numbers from 1 to 13889.  But that would have taken far too long. But one of the principles of collecting data from a hidden API is speed.<br>


### Solution

The simplest solution is to examine the `source code` of the page. In chrome, by doing an automatic line break we can see that the dates and corresponding IDs are all a list of dictionaries : <br>
```python
"dates":[{"id":"id13974","text":"6 Apr 2023"},{"id":"id13869","text":"22 Dec 2022"}...{"id":"id2","text":"8 Aug 1993"},{"id":"id1","text":"31 Dec 1992"}]
```  
<br>


{{< image src="images/source_code.png" >}}

<br>

So all that remains is to isolate this list, make it a json content and write a function to send it to the API url. To test it, you can first write this function in a separate file : `test.py`

```python
import scrapy
import json

class MySpider(scrapy.Spider):
    name = 'myspider'
    start_urls = ['https://www.fifa.com/fifa-world-ranking/men?dateId=id13974']

    def parse(self, response):
        script_content = response.xpath('//script[contains(., "dates")]/text()').extract_first()
        date_list = json.loads(script_content)
        date_list = date_list['props']['pageProps']['pageData']['ranking']['dates']
        
        print(date_list)

```
<br>

- First, We extracts the content of the first script tag in the response that contains the string `"dates"` with all the json content of the page.
- We transformed it into a Python dictionary 
- Extract the list of dates from the dictionary

To extract the list of dates, I used [json formater](https://jsonformatter.curiousconcept.com/#) which is a free online tool that allows to identify the keys quite quickly.<br>
Just copy all the json content, paste it into the window and click on the process button
<r>

![jsonformarterpicture](images/jsonformatter.png)

<br>



<br>

### Start_urls

We can now integrate this function into our code to retrieve all the API pages and therefore all the FIFA rankings since its creation in 1992
picture

<script src="https://gist.github.com/hericlibong/7fb055d3d38102414478ad2f1cb21bf4.js"></script>

First we import datetime to work on the date format of the page's source code list.
We change the start_urls. We enter the url of the ranking page instead of the API endpoint, in order to extract our list of dates from the source code of the page
<br>

### Parse function
<br>

We pass our method for extracting the list of dates and ids from the source code into the function
We create the loop with the list of dates and id by iterating over the API url.
we put the date in yyyy-mm-dd format
We send a request to the API with the date and the URL as parameters

<script src="https://gist.github.com/hericlibong/93857c703da18b63b30956d0ef03dfed.js"></script>
<br>

### Parse_ranking_data

<script src="https://gist.github.com/hericlibong/b163ab8a2ce568610bc3fd6f5aefe28d.js"></script>

From now on, we have everything we need for both:

- iterate over ids
- integrate the dates in the correct format to each corresponding ranking.

For this we will need:

- import datetime to put the dates in the correct format
- import the list that we copied on the source page
- create a new function.





```shell
scrapy runspider filename.py -o data.json
```



```shell
scrapy runspider filename.py -o data.csv
```


