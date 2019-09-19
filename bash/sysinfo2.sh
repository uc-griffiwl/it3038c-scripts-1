#!/bin/bash
#This Script will send information about this VM

emailaddress="watkinwj@mail.uc.edu"
today=$(date +"%m-%d-%Y@%H:%M")
ip=$(/usr/sbin/ifconfig | grep 'inet 192' | awk '{print $2}')

content="User: \t $USER \nHost Name: \t $HOSTNAME \nMy IP: \t $ip \n My machine type \t $MACHTYPE \nThe Date: \t $today \n"
mail -s "IT3038C Linux IP" $emailaddress <<< $(echo -e $content)
