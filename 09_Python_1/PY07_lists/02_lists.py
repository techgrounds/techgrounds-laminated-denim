numbers = [1, 3, 5, 7, 9]

for number in range(len(numbers)):
    #The following sets a variable for the current number in the loop.
    current_number = numbers[number]
    #This sets a variable for the next number in the loop.
    next_number = numbers[(number + 1) % len(numbers)]
    
    result = current_number + next_number
    print(result)