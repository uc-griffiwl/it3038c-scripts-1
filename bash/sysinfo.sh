#!/bin/bash
#this script will email info about the linux machine

emailaddress=watkinwj@mail.uc.edu
a=$(ip a |grep 'dynamic ens192'| awk '{print $2}')
b=$(date)
mail -s "IT3038C Linux IP" $emailaddress <<< $(echo Machine Type: $MACHTYPE)$(echo " ")$(echo MY IP is $a)$(echo Hostname: $HOSTNAME)$(echo $BASH_VERSION)$(echo $b) 
