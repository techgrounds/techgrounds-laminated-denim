#The below function will return the biggest number listed in the parameters.
def max_num(num1, num2, num3):
    if num1 >= num2 and num1 >= num3:
        return num1
    elif num2 >= num1 and num2 >= num3:
        return num2
    else:
        return num3
    
print(max_num(3, 6, 5))

#Strings and booleans can also be compared. Operators include:
# == checks to see if two values are equal
# != checks to see if two values are not equal.
# >, <, >=, <= are also options.