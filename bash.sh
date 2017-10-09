#!/bin/sh
#host,user,password
HOST='x.x.x.x'
PORT='x'
USER='xxx'
PASSWD='xxx'

#create two file to store lists
if [ ! -f ~/monday_class_list.txt ]; then
touch ~/monday_class_list.txt
fi
if [ ! -f ~/friday_class_list-txt ]; then
touch ~/friday_class_list.txt
fi

#login the ftp ,if succeed,output  incomprehensible text to two different places.
ftp -n $HOST $PORT > /tmp/ftp.worked 2> /tmp/ftp.failed <<END_SCRIPT
user $USER $PASSWD

#list content
dir monday_class/projects/speechprocessing  monday_class_list.txt
dir friday_class/projects/speechprocessing  friday_class_list.txt

#put content to ftp
put monday_class_list.txt monday_class/materials/speechprocessing/project_list.txt
put friday_class_list.txt friday_class/materials/speechprocessing/project_list.txt

quit
END_SCRIPT
exit 0
