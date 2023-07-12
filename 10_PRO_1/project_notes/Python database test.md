https://learn.microsoft.com/en-us/azure/mysql/single-server/connect-python

# Database python script
1. Download and install [Python 3.7 or above](https://www.python.org/downloads/) for your OS. Make sure to add Python to your `PATH`, because the MySQL connector requires that.
    
2. Open a command prompt or `bash` shell, and check your Python version by running `python -V` with the uppercase V switch.
    
3. The `pip` package installer is included in the latest versions of Python. Update `pip` to the latest version by running `pip install -U pip`.
    
    If `pip` isn't installed, you can download and install it with `get-pip.py`. For more information, see [Installation](https://pip.pypa.io/en/stable/installing/).
    
4. Use `pip` to install the MySQL connector for Python and its dependencies:
    
    BashCopy
    
    ```
    pip install mysql-connector-python
    ```

## Running the Python code samples

For each code example in this article:

1. Create a new file in a text editor.
    
2. Add the code example to the file. In the code, replace the `<mydemoserver>`, `<myadmin>`, `<mypassword>`, and `<mydatabase>` placeholders with the values for your MySQL server and database.
    
3. SSL is enabled by default on Azure Database for MySQL servers. You may need to download the [DigiCertGlobalRootG2 SSL certificate](https://cacerts.digicert.com/DigiCertGlobalRootG2.crt.pem) to connect from your local environment. Replace the `ssl_ca` value in the code with path to this file on your computer.
    
4. Save the file in a project folder with a _.py_ extension, such as _C:\pythonmysql\createtable.py_ or _/home/username/pythonmysql/createtable.py_.
    
5. To run the code, open a command prompt or `bash` shell and change directory into your project folder, for example `cd pythonmysql`. Type the `python` command followed by the file name, for example `python createtable.py`, and press Enter.
    
     Note
    
    On Windows, if _python.exe_ is not found, you may need to add the Python path into your PATH environment variable, or provide the full path to _python.exe_, for example `C:\python27\python.exe createtable.py`.
    

[](https://learn.microsoft.com/en-us/azure/mysql/single-server/connect-python#step-1-create-a-table-and-insert-data)

## Step 1: Create a table and insert data
```import mysql.connector
from mysql.connector import errorcode

# Obtain connection string information from the portal

config = {
  'host':'<mydemoserver>.mysql.database.azure.com',
  'user':'<myadmin>@<mydemoserver>',
  'password':'<mypassword>',
  'database':'<mydatabase>',
  'client_flags': [mysql.connector.ClientFlag.SSL],
  'ssl_ca': '<path-to-SSL-cert>/DigiCertGlobalRootG2.crt.pem'
}

# Construct connection string

try:
   conn = mysql.connector.connect(**config)
   print("Connection established")
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with the user name or password")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print(err)
else:
  cursor = conn.cursor()

  # Drop previous table of same name if one exists
  cursor.execute("DROP TABLE IF EXISTS inventory;")
  print("Finished dropping table (if existed).")

  # Create table
  cursor.execute("CREATE TABLE inventory (id serial PRIMARY KEY, name VARCHAR(50), quantity INTEGER);")
  print("Finished creating table.")

  # Insert some data into table
  cursor.execute("INSERT INTO inventory (name, quantity) VALUES (%s, %s);", ("banana", 150))
  print("Inserted",cursor.rowcount,"row(s) of data.")
  cursor.execute("INSERT INTO inventory (name, quantity) VALUES (%s, %s);", ("orange", 154))
  print("Inserted",cursor.rowcount,"row(s) of data.")
  cursor.execute("INSERT INTO inventory (name, quantity) VALUES (%s, %s);", ("apple", 100))
  print("Inserted",cursor.rowcount,"row(s) of data.")

  # Cleanup
  conn.commit()
  cursor.close()
  conn.close()
  print("Done.")
```

