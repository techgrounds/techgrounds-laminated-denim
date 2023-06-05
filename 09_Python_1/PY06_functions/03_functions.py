#A return statement essentially saves the value of a calculation and returns it to whatever code calls it.
def avg(var1, var2):
    return (var1 + var2) / 2

x = 128
y = 255
z = avg(x,y)
print("The average of",x,"and",y,"is",z)