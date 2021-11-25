##########################################################################
# File Name: dirspace.sh
# Author: houyichao
# mail: houyichaochao@gmail.com
# Created Time: 四 11/25 16:12:14 2021
# Last modified: 2021-11-25 16:12:14
# Description:
#########################################################################
#!/bin/bash

dir=$(pwd)

a="${dir}/*"

du -sh $a
