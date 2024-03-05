# public-shell
## step1

如果你的当前路径是public-shell主目录下，执行：

> pwd 命令，获得当前路径 current_dir

## step2

执行以下代码,将获得的current_dir目录路径添加到配置文件的PATH环境变量中

> export PATH=${current_dir}/sf:$PATH

添加完毕之后，运行:

> source ~/{.bash_profile、.zshrc等等}

使用zsh需要将 source .bash_profile 放到你的.zshrc 最后一行，其他终端遵循相同操作。

## step3
运行一下指令：

> chmod +x soft.sh

> ./soft.sh soft.sh

## step4

编写你的脚本 foo.sh，然后运行以下命令:

> soft foo.sh

## step5

现在你可以在任何地方调用你自己或者我提供的公共脚本了: 

> foo

祝生活愉快！ 

## Backup
脚本内容不定期更新，都是自己日常用到的，如果有需要，可以提issues，或者一起完善public-shell

## best wishes!

Author：forege1yc

Email: houyichaochao@gmail.com


