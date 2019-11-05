import requests, re
from bs4 import BeautifulSoup

result = requests.get ("https://www.shopballers.com/").content
src = result.content
soup = BeautifulSoup(r, 'html.parser')

tshirtnames =soup.findALL("h3") #only the titles of shirts are h3
    print(tshirtnames)
tags = soup.findALL("div", {"class":re.compile('(prod-price)')})
    print(tags)
   

