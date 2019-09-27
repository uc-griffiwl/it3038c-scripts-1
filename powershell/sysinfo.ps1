function getIP {
    (get-netipaddress).ipv4address | Select-String "192*"
    }

function getdate {
    (Get-Date)

}    

function gethostname {

    $env:computerName
}

function getHost {
    $Host.Version
}

function getusername {
 [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
}

    $username=getusername
    $hostVersion=gethost
    $hostname=gethostname
    $date=getdate
    $IP=getIP


    Send-mailmessage -To "botheaj@ucmail.uc.edu" -From "wil-col@hotmail.com" -Subject "IT3038C Windows Sysinfo" -Body "My IP is ($IP) - The date is ($date) - My username is ($username) - My computer name is ($hostname) - My powershell version is ($hostVersion)" -SmtpServer smtp.live.com -Port 25 -UseSsl -Credential (Get-Credential)