import time

start_time = time.time()

print('What is your name?')
myName = input()

while myName != 'Will':
	if myName == 'your name':
		print('hahah, funny, seriously, who are you?')
		myName= input()
	else:
		print('This is not your name. Please type your name!')
		myName = input()

print('Hello, ' + myName + '. That is a good name, how old are you?')
myAge = int(input())
programAge = int(time.time() - start_time)

if myAge < 13:
	print('Are you legally allowed to use this app?')
elif myAge == 13:
	print("You're a teenager now... that's cool, I guess")
elif myAge > 13 and myAge < 30:
	print("These are prime days. Enjoy them")
elif myAge >=30 and myAge < 65:
	print("it's all downhill from here")
else:
	print("...and you're not dead yet?")

time.sleep(1)
print("%s? That's funny, I'm %s seconds old." % (myAge. programAge))
print("I wish I was " + str(myAge * 2) + "years old. Then I would be twice your age haha!")


