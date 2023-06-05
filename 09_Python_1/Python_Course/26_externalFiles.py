#read command allows one to read an external file.

#Open opens a file; either via relative or absolute path.
#Target the file.
#Define the mode in which it is opened. R = read. w = write. a = append.
#r+ gives read + write.

import os

employee_file = open("Python_Course/26file.txt", "r")

print(employee_file.readable())

employee_file.close()
