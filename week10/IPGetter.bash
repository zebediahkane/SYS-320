ip addr | grep "inet" | grep "brd" | \
grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -n 1
