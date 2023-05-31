
#The below shows how to instantly convert an input to a float (an integer would also be possible.
#This would create an error if one entered something besides a number.
num1 = float(input("Enter first number: "))
op = input("Enter an operator: ")
num2 = float(input("Enter second number: "))

if op == "+":
    print(num1 + num2)
elif op == "-":
    print(num1 - num2)
elif op == "/":
    print(num1 / num2)
elif op == "*":
    print(num1 * num2)
else:
    print("Invalid operator.")