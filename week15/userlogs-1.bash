#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

function getFailedLogins(){
	failLine=$(cat "$authfile" | grep "Failed password")
	dateAndUser=$(echo "$failLine" | cut -d' ' -f1,2,11 | tr -d '\.')
	echo "$dateAndUser"
}



# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To - zebediah.kane@mymail.champlain.edu" > emailform.txt
echo "Subject - Logins" >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp zebediah.kane@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 



