##########################################################################
# File Name: acpp2.sh
# Author: Fuge And ZiYan
# mail: houyichaochao@gmail.com
# Created Time: 2024-03-22 10:03:58 
# Last modified: 2024-03-22 10:04:05 
# Description: 增加XML文件索引 FOR ZiYan
#########################################################################
#!/bin/sh
trap 'echo "Received SIGINT signal and exiting..."; exit 1' INT

TYPE=$(gum choose "run" "feat" "amend" "fix")

current_dir=$(pwd)
PROJECT=$(echo "$current_dir" | rev | cut -d'/' -f1 | rev)


# Commit these changes
if [ $TYPE = "run" ]
then
    # Debian/Ubuntu 系统：sudo apt-get install xmlstarlet
    # Red Hat/CentOS 系统：sudo yum install xmlstarlet
    # macOS（通过 Homebrew）：brew install xmlstarlet
    # remote.xml must in current folder
    PORT=$(xmlstarlet sel -t -m "//mapMapping[sourceLocation/path[contains(.,'$PROJECT')]]" -v "destLocation/port" -n remote.xml)

    if [[ -z $PORT ]]; then
        echo "PROJECT $PROJECT MATCH PORT NOT FOUND，CHECK PORJECT, EXIT!"
        exit
    else
        echo "PORT: $PORT"
    fi
    echo $PROJECT && npm run start -- --port $PORT

elif [ $TYPE = "amend" ]
then
gum confirm "$TYPE?" && git add . && git commit --amend && git push -f && def p -d

else
SUMMARY=$(gum input --value "$TYPE: " --placeholder "Summary of this change")
gum confirm "$SUMMARY?" && git add . &&  git commit -m "$SUMMARY" && git push && def p -d

fi
