#!/bin/bash

echo "File was accessed $(date '+%a %b %d %I:%M:%S %p %Z %Y')" >> /home/champuser/SYS-320/week15/fileaccesslog.txt

echo "To - zebediah.kane@mymail.champlain.edu" > /home/champuser/SYS-320/week15/accessemail.txt
echo "Subject - Access" >> /home/champuser/SYS-320/week15/accessemail.txt
echo "" >> /home/champuser/SYS-320/week15/accessemail.txt
cat /home/champuser/SYS-320/week15/fileaccesslog.txt | sed 's/File was accessed //g' | sed 's/EST //g' >> /home/champuser/SYS-320/week15/accessemail.txt
cat /home/champuser/SYS-320/week15/accessemail.txt | /usr/sbin/ssmtp zebediah.kane@mymail.champlain.edu
