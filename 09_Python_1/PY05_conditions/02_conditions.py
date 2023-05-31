right_number = 100
guess = ""

while guess != right_number:
    guess = float(input("Please enter a number: "))
    if guess == right_number:
        print("You guessed correctly!")
    elif guess < right_number:
        print("The number should be bigger!")
    else:
        print("The number should be smaller!")