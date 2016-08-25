#!/bin/bash
# Define log
echo "begin"
date=`date +%m%d`
rm -rf data_$date.txt
for((i = 0; i < 6; i++))
do  
mysql -uroot -p123456 ump4.7_gsms -e "
 SELECT  a.state AS fram_state ,COUNT(a.state) AS c_fram_state,b.state,COUNT(b.state),UNIX_TIMESTAMP(MAX(b.submit_resp_time)) - UNIX_TIMESTAMP(MIN(b.submit_resp_time)) FROM gsms_msg_frame_sms_$date a,gsms_msg_ticket_sms_$date b;
 select count(*) from gsms_msg_ticket_sms_0701 where state ='1' and number <>'0';	
    " >>data_$date.txt
  sleep 2
  echo "end"
done
