file="/var/log/apache2/access.log"

countingCurlAccess() {
	cat "$file" | grep -i "curl" | cut -d' ' -f1 | sort | uniq -c
}

results=$(countingCurlAccess)
echo "$results"
