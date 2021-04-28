部署4节点网络

## 配置说明
ChainSQL的配置文件一般放在与可执行文件 chainsqld 同级的目录中，名称为`chainsqld.cfg`

具体的配置信息可参考 [ChainSQL 配置文件详解](http://docs.chainsql.net/theory/cfg.html)

配置多个节点需要注意其中的`[ips]`与 `[validators]`需要节点间两两配置

众享实验室提供了一个[配置文件生成工具](https://github.com/ChainSQL/chainsql-tools)，可以将根据配置模板将`[ips]`与 `[validators]`都配置好

## 下载打包好的4个节点配置文件
1. 执行命令`cd ~ && wget http://chainsql.net/chainsql-cfgs.tar.gz`{{execute}} 下载 chainsql-cfgs.tar.gz 然后执行命令
2. 执行命令 `tar zxvf chainsql-cfgs.tar.gz -C ~/chainsql`{{execute}} 进行解压


## 启动节点，并查看状态
1. 执行`~/chainsql/startAll.sh`{{execute}} 启动4个节点

2. 查看进程`ps -ef|grep chainsqld`{{execute}}，可以看到4个chainsqld的进程

3. 执行`cd chainsql/1 && ./chainsqld peers` 可以看到当前1节点有3个邻节点

4. 执行`./chainsqld server_info`{{execute}} 等10秒（`uptime` 字段的值>=10）左右，`server_status`值会变成`normal`

## 退出节点
执行 `~/chainsql/stopAll.sh`{{execute}} 关闭4个节点，可用`ps -ef|grep chainsqld`{{execute}} 去确认