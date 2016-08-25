#!/bin/sh
date=`date +%m%d%H`
rm -rf speed_$date.txt
for((i=1;i<10000;i++))
do
#wc=`grep "begin to send" /home/ump/ump_4.7/gateway_3.6.0/message_push/logs/server.out|wc -l`
#wc=`grep -ao "15889339325" /home/ump_4.7/moni/socket/logs/server.out|wc -l`
wc=`grep -ao "15889339325" /home/ump_4.7/moni/http/logs/server.out|wc -l`
#wc=`grep -ao "&&&" /home/ump_4.7/moni/socket/logs/server.out|wc -l`
echo $i--`date +%m%d%H%M%S`--$wc>>speed_$date.txt
sleep 1
done
~
~
~
~
