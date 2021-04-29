给节点配置mysql数据库，这里使用mysql的docker镜像，实际项目中一般直接安装mysql-server

## docker启动mysql实例
1. 拉取mysql的docker镜像 `docker pull mysql:5.7`{{execute}}

2. 启动mysql实例：`docker run --name docker-mysql -e MYSQL_ROOT_PASSWORD=1234 -d -p 3306:3306 mysql:5.7`{{execute}}

## 在mysql中创建chainsql的数据库
1. 执行命令`docker exec -it docker-mysql sh`{{execute}}进入mysql的docker

2. 执行命令`mysql -uroot -p`{{execute}}，然后输入密码`1234`登录mysql

3. 执行命令`CREATE DATABASE IF NOT EXISTS chainsql DEFAULT CHARSET utf8;`{{execute}}在mysql中创建chainsql数据库

4. 执行命令`exit`{{execute}}退出mysql登录，然后执行`exit`{{execute}}退出mysql的docker

## 在节点1中配置mysql数据库
1. 执行`cd ~/chainsql/1 && vim chainsqld.cfg`{{execute}}对节点1的配置文件进行编辑

2. 在文件结尾插入以下内容，然后按`:wq`保存并退出文件：

<pre>
[sync_db]
type=mysql
host=127.0.0.1
port=3306
user=root
pass=1234
db=chainsql
first_storage=0
charset=utf8

[auto_sync]
1
</pre>

3. 可以用`cat chainsqld.cfg`{{execute}}查看配置文件，确认已经正确添加相关配置

4. 执行命令 `cd ~/chainsql && ./startAll.sh`{{execute}} 启动4个节点

然后`cd ~/chainsql/1 && ./chainsqld server_info`{{execute}}查看节点1的server_info等待`server_status`值变为normal