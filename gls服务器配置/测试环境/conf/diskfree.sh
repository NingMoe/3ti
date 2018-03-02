#!/bin/bash
flags=-umc

percent=`df -k | grep -v Filesystem| awk '{print int($5)}'`

for each_one in $percent
do
	if [ $each_one -ge 70 ];then
              /usr/sbin/tmpwatch "$flags" -x /tmp/.X11-unix -x /tmp/.XIM-unix \
	-x /tmp/.font-unix -x /tmp/.ICE-unix -x /tmp/.Test-unix \
	-x /tmp/.sock \
	-X '/tmp/hsperfdata_*' 1d /tmp
        fi
done
