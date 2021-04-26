单点运行chainsqld

在将chainsql节点程序下载到本地后，执行如下操作：

1. 创建chainsql文件夹 `mkdir chainsql`

2. 执行`tar zxvf chainsqld-linux-x64-1.1.4-pop.tar.gz -C chainsql`{{execute}}  命令将节点程序解压到 chainsql目录

3. 解压后执行 `cd chainsql`{{execute}} 进入到chainsql目录，然后执行 `ls` 命令可以看到目录下有chainsqld与 chainsqld.cfg两个文件，其中chainsqld.cfg是可单点执行的配置文件

4. 执行 `nohup ./chainsqld &`{{execute}} 命令后台启动chainsql节点

5. 执行 `watch ./chainsqld server_info`{{execute}} 可以查看节点状态，注意其中的 `server_status` 字段，大约等待10秒后，可以看到`server_status`的值由`abnormal`变成了`normal`，表示节点可用，可正常接收交易。

6. 执行`ps -ef|grep chainsqld` 可以看到有一个chainsql进程正在运行， 执行 `./chainsqld stop`命令停止运行chainsql进程，然后通过执行`ps -ef|grep chainsqld` 发现列表为空，可确认节点已经退出