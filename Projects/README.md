# Project 2 - Creating a SQL Database with Powershell Script

This script will automatically create a SQL database simply by running it


# Connection


```javascript
$Connect = New-Object Data.SqlClient.SqlConnection; 
$Connect.ConnectionString = "Data Source=.;Initial Catalog=master;Integrated Security=True;"; 
$Connect.Open(); 
```

This is the first part of the script, here we make a variable called "Connect". Here we are making a connection
to the SQL Server on the system. We make a variable and then a string to the variable. It connects to the server with Windows authentication


# Read the Server

Here we make another variable called SQL, this variable is a SQL select statement that basically goes out and 
reads the database names.

```javascript
$SQL = "Select name
        FROM sys.databases
        WHERE name = '$SqlDBname'"; 
```

# Read and Execute

Here we make a new variable that contains our other variables, reads and executes the  on the sql server, 
then closes the reader

```javascript
$SCommand = New-Object Data.SqlClient.SqlCommand $SQL, $Connect;
$Reader = $SCommand.ExecuteReader();

$Reader.Close();
```
#Creating the Database

Here we make a new variable "creater" that actually creates the database and make a new variable "SCommand" (same name, new variable) that runs the variables
creater and connect on the object

```javascript
$Creater = "Create Database [$SqlDBname];"
$SCommand = New-Object Data.SqlClient.SqlCommand $Creater, $Connect; 
$SCommand.ExecuteNonQuery();     
Write-Host "The Database $SqlDBname has been created";
```

# Closing the Session

Once you are done, you will want to close the connection, to this
```javascript
$Connect.Close();
```










