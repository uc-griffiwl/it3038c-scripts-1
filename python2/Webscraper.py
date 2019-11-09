import requests, re
from bs4 import BeautifulSoup

r = requests.get ("https://www.shopballers.com/").content

soup = BeautifulSoup(r, 'lxml')
tags = soup.findALL("a", {"href":re.compile('(products)')})
for a in tags:
    print(a.get('href'))





#tshirtnames =soup.findALL("h3") #only the titles of shirts are h3

#print(tshirtnames)
#tags = soup.findALL("div", {"class":re.compile('(prod-price)')})
#print(tags.text)
   

