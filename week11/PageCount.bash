file="/var/log/apache2/access.log"

pageCount() {
	cat "$file" | cut -d' ' -f7 | tr -d '/' | sort | uniq -c
}

results=$(pageCount)
echo "$results"
