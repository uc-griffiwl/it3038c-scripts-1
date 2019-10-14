# Lab 7 - Posh-SSH

I had trouble finding a decent module / addin to use for this lab but I ended up finding this
cool tool that allows you to ssh from within the powershell console and do a bunch of different things.

Link to the github for the module - github.com/darkoperator/Posh-SSH

# Install


```javascript

Install-Module -Name posh-ssh -force
```

After the install to ensure it downloaded sucessfully, lets make sure it is there run:

```javascript
Get-Module -ListAvailable -Name Posh-SSH
```

To get an SSH session started, you must enter the command below
```javascript
new-sshsession -computername -acceptkey -credential 
```

Example of what I used and worked
```javascript
new-sshsession -computername 192.168.33.108 -acceptkey -credential cechuser
```

Now that we are connected, we can run commands / do whatever we really need to from within powershell.

# How to run commands to the session

To run commands on the ssh session, we need to know the session #, to do this run

```javascript
Get-SSHSession
```
Now that we know the session ID we can run commands to the session, to do this

```javascript
Invoke-SSHCommand -Index 0 -command "pwd"
```
This command runs pwd on session 0

You can also run more than one command at one time like so
```javascript
Invoke-SSHCommand -Index 0 -command "uname -a; cd /; pwd; ls-l
```

# Uploading / Downloading Files

This module also comes with SFTP support. Example code for how it is used 
Upload
```javascript
Set-SCPFile -LocalFile C:\Users\Administrator\Documents\lab7.txt -RemotePath "/home/cechuser/lab7/testinglab7" -ComputerName 192.168.33.108 -Credential (Get-Credential cechuser)
```
Download 
```javascript
Get-SCPFile -LocalFile C:\Users\Administrator\Documents\lab7download.txt -RemotePath "/home/cechuser/lab7/testinglab7" -ComputerName 192.168.33.108 -Credential (Get-Credential cechuser)
```

Basically the same code, just chaning Set and Get

There are tons of things that this module can do, visit the github page posted above for more info.

# Closing the Session

Once you are done, you will want to close the session, to this
```javascript
Remove-SSHSession -Index 0 -Verbose
```
This example closes session 0.









