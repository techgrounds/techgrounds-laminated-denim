#Lists are valuable for collections of related values.
# [] is recognised by Python as a collection of values or list
#Items in a list have index values, listed below.
friends = ["Jay", "Silent Bob", "Randall", "Spacy", "Oscar"]
#           0           1               2
print(friends)
print(friends[1])
print(friends[2:4])
friends[1] = "Bob"
print(friends)
numbers = ["Jay", 5, 6.55]
print(numbers[1] + numbers[2])
print(f"{numbers[0]} is {numbers[1]} years old.")