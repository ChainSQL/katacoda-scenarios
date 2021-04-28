生成配置文件

1. 执行命令`wget https://github.com/ChainSQL/chainsql-tools/releases/download/v1.0.0/chainsql-tools.tar.gz`{{execute}} 下载 chainsql-tools.tar.gz 然后执行命令
2. 执行命令 `tar zxvf chainsql-tools.tar.gz`{{execute}} 进行解压
3. 执行`cd chainsql-tools`{{execute}} 进入到解压后的文件夹中
4. 执行`./gencfg.sh`{{execute}} 在生成4个配置文件，用`tree`{{execute}} 命令可以看到有`1`,`2`,`3`,`4`，4个文件夹,每个文件夹下有一个`chainsqld.cfg`文件
