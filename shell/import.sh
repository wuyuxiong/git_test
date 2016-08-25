#!/bin/sh  
#��������---��������--��������
# @file read_db_mysql.sh
# @brief read data from mysql
# @author wu
# @version 0.1
# @date 2016/07/28




ip=172.16.0.79
user=root
password=123456
dbname=ump4.6_gsms
table=gsms_msg_ticket_mms_0728
count=$1
#echo $ip
pwd=`pwd`
MYSQL=`which mysql`
#��������
mkdir -p $pwd/tmp
result="`$MYSQL -h $ip -u$user -p$password  $dbname << EOF
         select * from $table limit 1; 
EOF`"
sleep 1;
echo "$result" >$pwd/tmp/exprot.txt;
tail -1 $pwd/tmp/exprot.txt>$pwd/tmp/test.txt

#��������

awk -v count=$count '{for (i = 1; i<count; i++) print i$0}' $pwd/tmp/test.txt >$pwd/tmp/import.txt
echo "��������"

#��������
$MYSQL -h $ip -u$user -p$password  $dbname << EOF
LOAD DATA local INFILE '$pwd/tmp/import.txt' INTO TABLE $table ;
select count(*) from $table;
EOF
