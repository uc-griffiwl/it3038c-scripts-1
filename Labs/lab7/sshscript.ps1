new-sshsession -computername 192.168.33.108 -acceptkey -credential cechuser

invoke-sshcommand -Index 0 -command "pwd"