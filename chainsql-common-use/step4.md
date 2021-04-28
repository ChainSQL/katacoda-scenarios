表操作

这里都用根账户进行操作

1. 建表交易，执行下面的命令发送建表交易
```
curl -H "Content-Type: application/json" -X POST -d '
{
    "method": "t_create",
    "params": [{
        "secret": "xnoPBzXtMeMyMHUVTgbuqAfg1SUTb",
        "tx_json": {
            "TransactionType": "TableListSet",
            "Account": "zHb9CJAWyB4zj91VRWn96DkukG4bwdtyTh",
            "Tables": [
                {
                    "Table": { "TableName": "test_chainsql" }
                }
            ],
            "OpType": 1,
            "Raw": [
                {
                    "field": "id",
                    "type": "int",
                    "length": 11,
                    "PK": 1,
                    "NN": 1,
                    "UQ": 1
                },
                {
                    "field": "age",
                    "type": "int"
                },
                {
                    "field": "name",
                    "type": "varchar",
                    "length": 16
                },
            ],
            "Confidential": false
        }
    }]
}
' http://127.0.0.1:5005
```{{execute}}

通过上面的请求可以知道，我们建了一张名为`test_chainsql`的表，表中有`id,name,age`3个字段，并且是一张非加密表

2. 表插入交易，执行下面的命令向表中插入两条数据：
```
{
    "method": "r_insert",
    "params": [{
        "offline": false,
        "secret": "xnoPBzXtMeMyMHUVTgbuqAfg1SUTb",
        "tx_json": {
            "TransactionType": "SQLStatement",
            "Account": "zHb9CJAWyB4zj91VRWn96DkukG4bwdtyTh",
            "Owner": "zHb9CJAWyB4zj91VRWn96DkukG4bwdtyTh",
            "Tables":[
                {
                    "Table": { "TableName": "test_chainsql" }
                }
            ],
            "Raw": [
                {
                    "id": 1,
                    "name": "张三",
                    "age": 11
                },
                {
                    "id": 2,
                    "name": "李四",
                    "age": 12
                }
            ],
            "OpType": 6,
            "AutoFillField": "txHash"
        }
    }]
}
```{{execute}}

3. 在数据库中查看表
    - 执行命令 `docker exec -it docker-mysql sh`{{execute}} 进入到mysql容器
    - 执行命令 `mysql -uroot -p12341`{{execute}} 登录mysql
    - 执行命令 `use chainsql` 切换到chainsql数据库
    - 执行命令 `show tables;`{{execute}} 可以看到数据库中有两张表，`SyncTableState`为管理表，t_开头的是我们刚刚在链上建的表
    - 可以执行命令 `select * from SyncTableState;`{{execute}}查看管理表的内容

4. 查询表中的数据，执行下面的命令查询表中所有内容，注意将其中的 t_37F7B9AE97A20933D90D41AA86F76226EF467C5D换成数据库中真正的表名
```
	{
	    "method": "r_get_sql_admin",
	    "params": [
	        {
	            "sql": "select * from t_37F7B9AE97A20933D90D41AA86F76226EF467C5D"
	        }
	    ]
	}
```{{execute}}