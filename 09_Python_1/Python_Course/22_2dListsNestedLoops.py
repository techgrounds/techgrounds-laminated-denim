number_grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [0]
]
#To access a specific row in the list, square brackets with the index number.
print(number_grid[0])
#To access a specific column, add another square bracket with that index number.
print(number_grid[1][1])

for row in number_grid:
   #print(row) would print everything in number_grid just as normal.
    for col in row:
        #This prints every value in the array/list individually.
        #col a variable equivalent to every item in the list.
        print(col)