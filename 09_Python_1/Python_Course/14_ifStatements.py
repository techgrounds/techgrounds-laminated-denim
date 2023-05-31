is_male = True
is_tall = True

#anything below an "if" is executed if the "if" is True.
#One can add any number of lines of code below an if.
if is_male:
    print("You are a male")
else:
    print("You are not a male")

#or is a keyword; below would execute if either value is true.
if is_male or is_tall:
        print("You are a male or tall or both.")
else:
    print("You are neither male nor tall.")

#and is a keyword that requires both statements to match.
#elif means else if
#and not or not are also viable.
if is_male and is_tall:
     print("You are a tall male")
elif is_male and not(is_tall):
     print("You are a short male.")
elif not(is_male) and is_tall:
     print("You aren't male, but are tall.")
else:
     print("You aren't a male, not tall, or both.")
