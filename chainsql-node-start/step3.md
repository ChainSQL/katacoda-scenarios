部署4节点网络

## 配置说明
ChainSQL的配置文件一般放在与可执行文件 chainsqld 同级的目录中，名称为chainsqld.cfg

具体的配置信息可参考 [ChainSQL 配置文件详解](http://docs.chainsql.net/theory/cfg.html)

配置多个节点需要注意其中的`[ips]`与 `[validators]`需要节点间两两配置

## 使用工具生成4个配置文件
1. 执行命令下载 chainsql-tools.tar.gz 然后执行命令
2. 执行命令 `tar zxvf chainsql-tools.tar.gz` 进行解压
3. 执行`cd chainsql-tools` 进入到解压后的文件夹中
4. 执行`./gencfg.sh` 生成4个配置文件

## 启动节点，并查看状态
1. 执行`chainsql/start.sh`启动4个节点
2. 执行`./chainsqld peers` 可以看到当前节点有3个邻节点
4. 执行`./chainsqld server_info` 等10秒左右，`server_status`值会变成`normal`

## 退出节点
执行 `chainsql/stop.sh` 关闭4个节点，可用`ps -ef|grep chainsqld` 去确认