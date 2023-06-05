
#friend and letter are variables; you could replace them with anything.
friends = ["Jim", "Karen", "Kevin"]
#Prints each friend on a new line.
for friend in friends:
    print(friend)
#Prints each letter ('letter' is a variable; this could be named anything.)
for letter in "Giraffe Academy":
    print(letter)
#Prints everything in a range from 3-10
for index in range(3, 10):
    print(index)
#Prints everything in range 10
for index in range(10):
    print(index)
#Prints the length of friends.
#Replacing index with an index number prints friend*len.
for index in range (len(friends)):
    print(friends[index])
#Does something on index number of loop.
for index in range(5):
    if index == 0:
        print("First iteration")
    else:
        print("Not first")