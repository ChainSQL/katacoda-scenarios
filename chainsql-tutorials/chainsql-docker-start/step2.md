
1. 执行命令`wget https://github.com/ChainSQL/chainsql-tools/releases/download/v1.0.0/chainsql-tools.tar.gz`{{execute}} 下载 chainsql-tools.tar.gz 然后执行命令

2. 执行命令 `tar zxvf chainsql-tools.tar.gz`{{execute}} 进行解压

3. 执行`./genCfg.sh`{{execute}} 在生成4个配置文件，用`tree`{{execute}} 命令可以看到有`1`,`2`,`3`,`4`，4个文件夹,每个文件夹下有一个`chainsqld.cfg`文件

4. 这里有个问题，我们用工具生成的cfg文件中，ip用的是127.0.0.1，但是因为docker是一个虚拟环境,`127.0.0.1`指的是虚拟环境内部,而不是外部宿主机，所以用`127.0.0.1`无法在节点间建立连接，我们需要修改下ip地址：

执行`ifconfig`{{execute}} 命令，在`ens3`中，我们可以看到宿主机的ip地址，如`172.17.0.20`。分别进入1，2，3，4文件夹，修改chainsqld.cfg 文件，将`[ips]`中的`127.0.0.1`修改为查询到的ip地址