echo "<html>" > report.html
echo "<body>" >> report.html

echo "<p>Access logs with IOC indicators:<p><br><br>" >> report.html
echo "<table border='1'>" >> report.html

while read -r ip datetime page; do
	echo "<tr>" >> report.html
	echo "<td>$ip</td>" >> report.html
	echo "<td>$datetime</td>" >> report.html
	echo "<td>$page</td>" >> report.html
	echo "</tr>" >> report.html


done < report.txt 

echo "</table>" >> report.html

echo "</body>" >> report.html
echo "</html>" >> report.html

sudo mv report.html /var/www/html/report.html
