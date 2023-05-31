#Return function essentially saves the value of a calculation and returns it to whatever code calls it.
#Any code AFTER a return statement is ignored; return essentially exits and finishes the function.
#Integers, strings, booleans, arrays can all be returned from a function.
def cube(num):
    return num*num*num

result = cube(3)
print(cube(4))
print(cube(3))
