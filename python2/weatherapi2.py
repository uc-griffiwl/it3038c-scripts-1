import json
import requests

r = requests.get('http://localhost:3000/')
data = r.json()

print(data[0]['name'])
print("is")
print(data[0]['color'])
print

print(data[1]['name'])
print("is")
print(data[1]['color'])
print

print(data[2]['name'])
print("is")
print(data[2]['color'])
print

print(data[3]['name'])
print("is")
print(data[3]['color'])
print