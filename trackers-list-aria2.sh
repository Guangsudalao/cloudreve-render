
#!/bin/bash
list=`wget -qO- https://trackerslist.com/all.txt |awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "bt-tracker" /root/aria2/aria2.conf`" ]; then
    sed -i '$a bt-tracker='${list} /root/aria2/aria2.conf
    echo add......
else
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" /root/aria2/aria2.conf
    echo update......
fi
rm -rf /root/Download/*
nohup aria2c --conf-path=/root/aria2/aria2.conf  &
