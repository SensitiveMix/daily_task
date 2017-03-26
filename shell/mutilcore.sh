#!/bin/bash
ip=`cat iplist.txt|grep -v "#"|awk '{print $1}'`   #过滤服务器IP
dir='/usr/local/src'  #目标路径

thead_num=50 #自定义并发数，根据自身服务器性能或应用调整大小，开始千万别定义太大，避免管理机宕机
tmp_fifo_file="/tmp/$$.fifo"  #以进程ID号命名管道文件
mkfifo $tmp_fifo_file   #创建临时管道文件
exec 4<>$tmp_fifo_file  #以读写方式打开tmp_fifo_file管道文件,文件描述符为4，也可以取3-9任意描述符
rm -f $tmp_fifo_file    #删除临时管道文件，也可不删除
for ((i=0;i<$thead_num;i++))   #利用for循环向管道中输入并发数量的空行
do
        echo ""  #输出空行
done >&4  #输出重导向到定义的文件描述符4上


for i in $ip  #循环所有要执行的服务器
do
        read -u4  #从管道中读取行，每次一行，所有行读取完毕后执行挂起，直到管道有空闲的行
                {
                        scp -P 1000 $1 $i:$dir    #所有要批量执行的命令都放在大括号内，scp是一个简单实例，可替换任意其他命令及命令组，1000为服务器端的端口
                        sleep 3  #暂停3秒，给系统缓冲时间，达到限制并发进程数量
                        echo "" >&4  #再写入一个空行，使挂起的循环继续执行
                }&  #放入后台执行
done
wait  #等待所有后台进程执行完成
exec 4>&-  #删除文件描述符
exit 0
