[String]$SqlDBname = "DatabaseFromScript"; #here is the variable for the database and you can change the name here
 
$Connect = New-Object Data.SqlClient.SqlConnection; #make variable to sql
$Connect.ConnectionString = "Data Source=.;Initial Catalog=master;Integrated Security=True;"; #add string to our variable, define security
$Connect.Open(); #opens connection
 
$SQL = "Select name
        FROM sys.databases
        WHERE name = '$SqlDBname'"; #added variable and sql select statement - returns databases
 

$SCommand = New-Object Data.SqlClient.SqlCommand $SQL, $Connect;
$Reader = $SCommand.ExecuteReader();#here we make a new variable that contains out other variable, reads and executes on the sql server

$Reader.Close();


$Creater = "Create Database [$SqlDBname];" #here we create new variables (used same name as old variable just because they use the same object)
$SCommand = New-Object Data.SqlClient.SqlCommand $Creater, $Connect; # these variables create the database
$SCommand.ExecuteNonQuery();     

 Start-Sleep -Seconds20

Write-Host "The Database $SqlDBname has been created"; #just so we know it actually was created

$MSM = 'Microsoft.SqlServer.Management.Smo'
$Server = new-object ("$MSM.Server") 
 
$DBint = [Microsoft.SqlServer.Management.Smo.Datatype]::Int #make data types we will use for these columns
$DBdatetime = [Microsoft.SqlServer.Management.Smo.Datatype]::DateTime
 
$Database = $Server.Databases["DatabaseFromScript"] #call the database just created
 

$SchemaName = "Stock"
$Schema = $Database.Schemas[$SchemaName] #make variables for schema
 

$Schema = New-Object ('Microsoft.SqlServer.Management.SMO.Schema') ($Database, $SchemaName)
$Schema.Create() #create it

Write-Host "Schema created, Named: $SchemaName"

 

$Table = new-object ("$MSM.Table") ($Database, "Test", "Stock") #make table
 

$ColumnPCID = new-object ("$MSM.Column") ($Table, "ComputerID", $DBint)#Create ComputerID column
$ColumnPCID.Identity = $true
$ColumnPCID.IdentitySeed = cls #adds value to first column for ID 
$ColumnPCID.IdentityIncrement = 1
$Table.Columns.Add($ColumnPCID)
 


$ColumnDate = new-object ("$MSM.Column") ($Table, "AcquiredDate", $DBdatetime) 
$ColumnDate.Nullable = $false
$Table.Columns.Add($ColumnDate) #Create the Date column
 

$Table.Create() #create the table

$Connect.Close(); # here we close the connection to the DB