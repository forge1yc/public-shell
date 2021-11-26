##########################################################################
# File Name: c_schedule.sh
# Author: houyichao
# mail: houyichaochao@gmail.com
# Created Time: 五 11/26 11:11:06 2021
# Last modified: 2021-11-26 11:11:06
# Description:
#########################################################################
#!/bin/bash

# 获取命令名字
cmd=$1

while :
do 
    # 这样的方法可以执行自定义的命令
    bash ${cmd}
    sleep 1s
    echo 
done

