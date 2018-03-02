#!/bin/bash
#日志将要存放的路径
basepath_log='/apps/webserver/tengine/logs/logbuckup'
savepath_log=$basepath_log/$(date +%Y)/$(date +%m)/$(date +%d)/
#nginx的日志路径
logs_path='/apps/webserver/tengine/logs'
#创建目录
mkdir -p $savepath_log/
#切换目录
cd ${logs_path}
#遍历nginx的日志路径中所有的log文件
for fileLog in `ls *.log`
do
    mv ${fileLog} $savepath_log/${fileLog}_$(date +%Y%m%d%H%M).log
done
#重启Nginx
kill -USR1 $(cat /apps/webserver/tengine/nginx.pid)
#压缩Log文件
cd ${savepath_log}
#遍历nginx的日志存放路径
for fileLog in `ls *.log`
do
    tar zcf ${fileLog}.tar.gz -C ${savepath_log} ${fileLog}
    rm -rf ${fileLog}
done

