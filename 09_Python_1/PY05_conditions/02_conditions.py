num_input = input("Please enter a whole number: ")
if (int(num_input)) == 100:
    print(f"{num_input} is perfect!")
elif (int(num_input)) >= 100:
    print(f"{num_input} could be smaller.")
else:
    print(f"{num_input} could be bigger.")