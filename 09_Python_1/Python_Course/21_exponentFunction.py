#Easy way to do an exponent in python
print(2**3)

#Function takes in a base number and power number.
#Result stores the result of the math.
#For loop loops an amount equivalent to pow_num.
#Result starts with 1 multiplied by base_num (say, 3.) This repeats equal to pow_num.
#Result is returned when loop finishes.
def raise_to_power(base_num, pow_num):
    result = 1
    for index in range(pow_num):
        result = result * base_num
    return result

print(raise_to_power(3, 4))
