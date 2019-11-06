import requests, re
from bs4 import BeautifulSoup

r = requests.get ("https://www.barnesandnoble.com/w/toys-games-pop-games-funko-pop-games-marvel-contest-of-champions-king-groot/32045919").content

soup = BeautifulSoup(r, 'html.parser')
span = soup.find("span", id="pdp-cur-price")
print(span.text)
