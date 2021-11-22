##########################################################################
# File Name: soft.sh
# Author: houyichao
# mail: houyichaochao@gmail.com
# Created Time: 一 11/22 10:55:49 2021
 # Last modified: 2021-11-22 10:55:49
#########################################################################
#!/bin/bash

dir=`pwd`



if [ -e sf ]
        then
            echo "默认指定的 sf 目录存在"
        else
        {
            echo "create the sf dir to save soft link"
            `mkdir sf`
            echo "success create sf"
        }
fi

src="${dir}/$1"
tmpdes="${dir}/$2"

# 设置可执行
chmod +x ${src}
echo "success make $src +x"

if [ ${src} == ${tmpdes} ]; then
    echo "error src name and des name can not same"
    exit 1
fi

des="${dir}/sf/$2"

echo "src: ${src}"
echo "des: ${des}"


errOut=`ln -sf $src $des`
if [ -e "No such file or directory" ]
    then
        echo "No such file ordirecory"
        exit 1
fi

echo "success create soft link: $src -> $des"


