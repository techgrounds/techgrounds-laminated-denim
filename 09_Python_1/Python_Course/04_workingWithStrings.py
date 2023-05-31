phrase = "Giraffe Academy"
#Concatenation
print(phrase + " is cool")
#backslash renders the following symbol literally
print("Giraffe\"Academy")
#Functions edit how a string is displayed
print(phrase.upper())
print(phrase.isupper())
print(phrase.upper().isupper())
#length function prints the length of a string
print(len(phrase))
#The following grabs a specific character, 0 being the first character in a string
print(phrase[0])
#A value given to a function is called a parameter.
#The index function returns the location of a character in a string, or the start of a series of characters.
print(phrase.index("G"))
print(phrase.index("Academy"))
print(phrase.replace("Giraffe", "Elephant"))
