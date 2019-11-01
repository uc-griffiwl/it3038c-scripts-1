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
Write-Host "The Database $SqlDBname has been created"; #just so we know it actually was created
 
$Connect.Close(); # here we close the connection

