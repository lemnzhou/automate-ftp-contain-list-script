#!/bin/sh
HOST='x.x.x.x'
PORT='x'
USER='xxx'
PASSWD='xxx'

if [ ! -f ~/monday_class_list.txt ]; then
touch ~/monday_class_list.txt
fi
if [ ! -f ~/friday_class_list-txt ]; then
touch ~/friday_class_list.txt
fi
ftp -n $HOST $PORT > /tmp/ftp.worked 2> /tmp/ftp.failed <<END_SCRIPT
user $USER $PASSWD
dir monday_class/projects/speechprocessing  monday_class_list.txt

dir friday_class/projects/speechprocessing  friday_class_list.txt

put monday_class_list.txt monday_class/materials/speechprocessing/project_list.txt
put friday_class_list.txt friday_class/materials/speechprocessing/project_list.txt

quit
