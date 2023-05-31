#Input from a user is by default a string; numbers are seen as text.
num1 = input("Enter a number: ")
num2 = input("Enter another number: ")
result = num1 + num2
print(result)

#int looks for a full number and converts it to an integer, i.e. a full number.
#This gives an error if you enter decimals.
result2 = int(num1) + int(num2)
print(result2)
#Float is basically the same function as above, but looks for a decimal number.
num3 = input("Enter a number: ")
num4 = input("Enter another number: ")
result3 = float(num3) + float(num4)
print(result3)