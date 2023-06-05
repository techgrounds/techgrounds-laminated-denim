#The function below translates every vowel into a g.
#Checks for letters in a phrase.
#Translates any lower case vowels to a lower case g.
#Translates any upper case vowels to an upper case G.
#Else, returns the consonant.
#The print function calls the function, then an input for the phrase parameter.

def translate(phrase):
    translation = ""
    for letter in phrase:
        if letter.lower() in "aeiou":
            if letter.isupper():
                translation = translation + "G"
            else:
                translation = translation + "g"
        else:
            translation = translation + letter 
    return translation

print(translate(input("Enter a phrase: ")))
