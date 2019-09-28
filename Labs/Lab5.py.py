import random #importing number game (pretty cool it is an import)

guessesTaken = 0

print('Hey, Welcome to the random number game!')




number = random.randint(1, 50)

print('The number is between 1 and 50.')



while guessesTaken < 6:

    print('Take a guess.') 

    guess = input()

    guess = int(guess)



    guessesTaken = guessesTaken + 1



    if guess < number:

         print('Your guess is too low.') 



    if guess > number:

         print('Your guess is too high.')


    if guess == number:

         break



if guess == number:

     guessesTaken = str(guessesTaken)

     print('Nice!, you guessed the number in ' + guessesTaken + ' guesses!')



if guess != number:

     number = str(number)

     print('The random number was ' + number)
