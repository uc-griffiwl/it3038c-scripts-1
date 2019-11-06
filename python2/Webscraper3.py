import requests, re
from bs4 import BeautifulSoup

r = requests.get ("https://www.shopballers.com/collections/new-products/products/fantasy-footballers-logo-tee").content

soup = BeautifulSoup(r, 'html.parser')
span = soup.find("h1", itemprop="name") #gets name of item
print(span.text)
span2 = soup.find("span", itemprop="price") #gets price of item
print(span2.text)
span3 = soup.find("option", value="20279768973371") #gets what I have selected
print(span3.text)

