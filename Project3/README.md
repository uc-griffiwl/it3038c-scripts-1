# Final Project - Creating a SQL Database with Powershell Script and adding Schema/Tables to the Database

This script will automatically create a SQL database simply by running it
You must have SQL Database installed
You must have integrated security enabled (should be already)


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
```

#Wait for the Database to Create

This will make the script wait for 20 seconds

```javascript
Start-Sleep -Seconds 20
```
So we know the database was created

```javascript
Write-Host "The Database $SqlDBname has been created";
```
#Now we get into adding Schema/Tables

Here we make a couple variables we will need to call to hit SQL

```javascript
$MSM = 'Microsoft.SqlServer.Management.Smo'
$Server = new-object ("$MSM.Server") 
```
#Data Types for our table

Here we make variables for our SQL data types that we will use, there are others but we will just use two

```javascript
$DBint = [Microsoft.SqlServer.Management.Smo.Datatype]::Int 
$DBdatetime = [Microsoft.SqlServer.Management.Smo.Datatype]::DateTime
```
#Specify the database we want to edit (the one just made above)

```javascript 
$Database = $Server.Databases["DatabaseFromScript"] 
```
#Schema

Here we define the variables for the schema

```javascript
$SchemaName = "Stock"
$Schema = $Database.Schemas[$SchemaName] #make variables for schema
```
Create the schema

```javascript
$Schema = New-Object ('Microsoft.SqlServer.Management.SMO.Schema') ($Database, $SchemaName)
$Schema.Create() 
```
Add this to confirm schema was made

```javascript
Write-Host "Schema created, Named: $SchemaName"
```
#Making the table and adding Columns 

Specify our table

```javascript
$Table = new-object ("$MSM.Table") ($Database, "Test", "Stock")
```
Makes column in the table and specify attributes of column 

```javascript
$ColumnPCID = new-object ("$MSM.Column") ($Table, "ComputerID", $DBint)#Create ComputerID column
$ColumnPCID.Identity = $true
$ColumnPCID.IdentitySeed = cls
$ColumnPCID.IdentityIncrement = 1
$Table.Columns.Add($ColumnPCID)
```
Create another column in our table and specify attributes

```javascript
$ColumnDate = new-object ("$MSM.Column") ($Table, "AcquiredDate", $DBdatetime) 
$ColumnDate.Nullable = $false
$Table.Columns.Add($ColumnDate) #Create the Date column
``` 
Creates the table based on code above

```javascript
$Table.Create() #create the table
```

# Closing the Session

Once you are done, you will want to close the connection, to do this

```javascript
$Connect.Close();
```










