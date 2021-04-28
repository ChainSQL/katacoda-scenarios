在容器中启动节点

1. 拉取docker部署相关的配置文件：
`cd ~ && wget http://chainsql.net/chainsql-deploy.tar.gz && tar zxvf chainsql-deploy.tar.gz && rm chainsql-deploy.tar.gz`{{execute}}

2. 执行以下命令，用docker启动4个节点
`docker-compose -f chainsql-deployment.yaml up -d`{{execute}}

3. 查看容器列表`docker ps`{{execute}} 可以看到我们启动了4个容器，名称分别为`node1`,`node2`,`node3`,`node4`

4. 进入节点1的容器`docker exec -it node1 sh`{{execute}}

5. 查看节点状态`./chainsqld server_info`{{execute}}
 
6. 查看邻接节点信息`./chainsqld peers`{{execute}}