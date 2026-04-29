page=$(curl -s 10.0.17.6/IOC.html)
echo $page | grep -oP '(?<=<td>)[^<]+' | sed -n '1~2p' > IOC.txt
