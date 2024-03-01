##########################################################################
# File Name: rate_of_progress.sh
# Author: houyichao
# mail: houyichaochao@gmail.com
# Created Time: 五  9/22 10:39:42 2023
# Last modified: 2023-09-22 10:39:42
# Description:
#########################################################################
#!/bin/bash

# Function to draw a progress bar
draw_progress() {
    local width=50 # 进度条宽度
    local percent=$1
    local num_chars=$((width * percent / 100))

    printf "["
    for ((i=0; i<width; i++)); do
        if [ $i -lt $num_chars ]; then
            printf "="
        else
            printf " "
        fi
    done
    printf "] %d%%" $percent
}

# Loop to update the progress bar
for ((i=0; i<=100; i+=10)); do
    draw_progress $i
    sleep 1
    printf "\r" # 返回到行首
done

printf "\n" # 换行

