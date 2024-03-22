##########################################################################
# File Name: test.sh
# Author: houyichao
# mail: houyichaochao@gmail.com
# Created Time: 一 11/22 11:04:42 2021
 # Last modified: 2021-11-22 11:04:42
#########################################################################
#!/bin/bash
echo "hello world"

current_folder="cloud-ram-widget-permission"
# sed -nE '/<sourceLocation>.*'$current_folder'.*<\/sourceLocation>/{n;n;n;s/[^0-9]//gp}' remote.xml

# sed -nE '/<sourceLocation>.*'$current_folder'.*<\/sourceLocation>/{n;n;n;s/[^0-9]//gp}' remote.xml

# port=$(awk -F'[<>]' -v folder="$current_folder" '$2 == "sourceLocation" && $6 ~ folder {getline; getline; if ($2 == "port") print $3}' remote.xml)

# port=$(awk -F'[<>]' -v folder="$current_folder" '$2 == "sourceLocation" && $6 ~ folder {found=0} $2 == "port" && found==1 {print $3} $2 == "path" && $6 ~ folder {found=1}' remote.xml)
# 转换通配符为正则表达式
# regex_folder=$(echo "$current_folder" | sed 's/\*/.*/g')

# 使用awk匹配符合条件的行，并提取对应的端口号
# port=$(awk -F'[<>]' -v folder="$regex_folder" '$2 == "sourceLocation" && $6 ~ folder {found=0} $2 == "port" && found==1 {print $3} $2 == "path" && $6 ~ folder {found=1}' remote.xml)
# port=$(awk -F'[<>]' -v folder="$current_folder" '$2 == "sourceLocation" && $6 ~ folder {getline; getline; if ($2 == "port") print $3}' remote.xml)


port=$(xmlstarlet sel -t -m "//mapMapping[sourceLocation/path[contains(.,'$current_folder')]]" -v "destLocation/port" -n remote.xml)


echo "Port found: $port"
