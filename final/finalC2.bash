logfile="$1"
iocfile="$2"

> report.txt

while read -r pattern; do

	grep -F "$pattern" "$logfile" | while read -r line; do

		ip=$(echo "$line" | cut -d' ' -f 1)
		datetime=$(echo "$line" | cut -d' ' -f 4 | tr -d '[')
		page=$(echo "$line" | cut -d' ' -f 7)
		echo "$ip $datetime $page" >> report.txt
	done

done < "$iocfile"
