url="10.0.17.6/Assignment.html"

page=$(curl -sL "$url")

temps=$(echo $page | xmlstarlet sel -t -m "//table[@id='temp']/tr" -v "td" -n | awk 'NR % 2 == 0')
press=$(echo $page | xmlstarlet sel -t -m "//table[@id='press']/tr" -v "td" -n | awk 'NR % 2 == 0')
dates=$(echo $page | xmlstarlet sel -t -v "//table[@id='press']//tr//td" | awk 'NR % 2 == 0')

count=$(echo "$dates" | wc -l)

for ((i=0; i<="${count}"; i++ ))
do
	var1=$(echo "$press" | head -n $i | tail -n 1)
	var2=$(echo "$temps" | head -n $i | tail -n 1)
	var3=$(echo "$dates" | head -n $i | tail -n 1)
	echo "$var1 $var2 $var3"
done

# echo ${joinedValues[@]}
