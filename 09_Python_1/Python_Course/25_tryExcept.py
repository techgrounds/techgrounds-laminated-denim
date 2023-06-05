#A try/except block tries to do something.
#If it fails or calls an error, it calls the except code.
#You can specify the except for a specific error.
#Below, division by zero will call the listed code.
#If one were to remove the div/0 but enter text, it would print invalid input.
#One can store errors as a variable and print those. See div/0 code.
try:
    value = 10 / 0
    number = int(input("Enter a number: "))
    print(number)
except ZeroDivisionError as err:
    print(err)
except ValueError:
    print("Invalid Input.")

#Best practice is to except specific errors.