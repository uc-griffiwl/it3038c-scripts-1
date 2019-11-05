import requests, re

data = "Hello, my email is watkinwj@mail.uc.edu. Please contact me!"

p = re.compile('[A-z0-9@%_.-]+@[A-z0-9@%_.-]+\.+(com|net|org|edu|ninja)+')

print(p.search(data).group())