#The below shows key value pairs. Keys should not be duplicated; they should be unique.
monthConversions = {
    "Jan": "January",
    "Feb": "February",
    "Mar": "March",
    "Apr": "April",
    "May": "May",
    "Jun": "June",
    "Jul": "July",
    "Aug": "August",
    "Sep": "September",
    "Oct": "October",
    "Nov": "November",
    "Dec": "December",
}
#By referring to the key, the value is called.
print(monthConversions["Nov"])
print(monthConversions.get("Dec"))
print(monthConversions.get("dfg", "Not a valid key"))