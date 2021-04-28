在容器中启动节点

1. 分别执行以下命令，用docker启动4个节点
`docker run -d --name node1 -p 5125:5125 -v /root/1/chainsqld.cfg:/opt/chainsql/chainsqld.cfg peersafes/chainsql:latest`{{execute}}
`docker run -d --name node2 -p 5126:5126 -v /root/2/chainsqld.cfg:/opt/chainsql/chainsqld.cfg peersafes/chainsql:latest`{{execute}}
`docker run -d --name node3 -p 5127:5127 -v /root/3/chainsqld.cfg:/opt/chainsql/chainsqld.cfg peersafes/chainsql:latest`{{execute}}
`docker run -d --name node4 -p 5128:5128 -v /root/4/chainsqld.cfg:/opt/chainsql/chainsqld.cfg peersafes/chainsql:latest`{{execute}}
2. 进入节点1的容器`docker exec -it node1 sh`{{execute}}
3. 查看节点状态`./chainsqld server_info`{{execute}}
4. 查看邻接节点信息`./chainsqld peers`{{execute}}