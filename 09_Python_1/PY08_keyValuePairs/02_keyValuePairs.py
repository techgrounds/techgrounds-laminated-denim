import csv

# Prompt user for information.
first_name = input("Enter your first name: ")
last_name = input("Enter your last name: ")
job_title = input("Enter your job title: ")
company = input("Enter your company name: ")

# Create a dictionary to store the information.
user_info = {
    'First Name': first_name,
    'Last Name': last_name,
    'Job Title': job_title,
    'Company': company
}

# Write the information to a CSV file.
header = user_info.keys()
data = user_info.values()

with open('PY08_keyValuePairs/user_info.csv', 'a', newline='') as file:
    writer = csv.writer(file)
    if file.tell() == 0:  # Check if the file is empty
        writer.writerow(header)  # Write header if the file is empty
    writer.writerow(data)
    
print("User information has been saved to user_info.csv.")
