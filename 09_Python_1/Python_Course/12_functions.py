#Functions allow one to break up code into chunks designed to do specific tasks.
#The below defines the function (sayhi); any code inside the function needs to be indented below it.
#Functions should be all in lowercase, typically with underscore to separate words.
def sayhi():
    print("Hi!")

#To call or use a function, use the following:
sayhi()
#Functions can request parameters in order to activate.
def say_hi2(name, age):
    print("Hello " + name + ", you are " +str(age))

say_hi2("JASON", 99)