if [ $# -eq 0 ] 
then
	echo "Usage: $0 <Prefix>" && exit 1
fi

prefix=$1

if [ ${#prefix} -lt 5 ]
then
	printf "Prefix length is too short\nPrefix example: 10.0.17\n" && exit 1
fi

for i in $(seq 1 255)
do
	ping -c 1 "$prefix.$i" &>/dev/null
	if [[ $? -eq 0 ]]
	then
		echo "$prefix.$i"
	fi
done

