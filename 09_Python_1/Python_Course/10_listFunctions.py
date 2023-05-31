lucky_numbers = [50, 4, 8, 15, 16, 23, 42]
friends = ["Kevin", "Karen", "Jim", "Oscar", "Theodore"]
#.extend appends another list.
friends.extend(lucky_numbers)
#.append appends another item to a list.
friends.append("Kelly")
#.insert adds a new value at the listed position.
friends.insert(1, "Jimmy")
#remove removes an item
friends.remove("Jimmy")
#clear empties the list
#pop pops the last item off the list, removing it.
friends.pop()
print(friends)
print(friends.index("Kevin"))
print(friends.count("Jim"))
#sort sorts numbers or letters in ascending or alphabetical order.
#.reverse does the opposite
lucky_numbers.sort()
print(lucky_numbers)
#.copy creates a copy
friends2 = friends.copy()