账户的基本操作

ChainSQL在创世块中有一个根账户（`zHb9CJAWyB4zj91VRWn96DkukG4bwdtyTh`），所有的系统币(ZXC)都在这个根账户中，可以执行命令
`./chainsqld account_info zHb9CJAWyB4zj91VRWn96DkukG4bwdtyTh`{{execute}} 查看根账户信息，可以看到它的余额信息`Balance`字段

## 激活账户
1. 生成一个新的账户`./chainsqld wallet_propose`{{execute}}，并复制结果中的`account_id`字段的值，如`z9t6fxjiRMx7P5wTJEX65p6ys9JFxWSN93`
2. 执行命令 `./chainsqld account_info z9t6fxjiRMx7P5wTJEX65p6ys9JFxWSN93`{{execute}} 查看账户信息，会报一个`actNotFound`的错误，说明账户在链上不存在
3. 执行下面的命令激活新的账户，注意将`Destinaion`字段值成之前复制的`account_id`值
```
curl -H "Content-Type: application/json" -X POST -d '
{
    "method": "submit",
    "params": [{
        "offline": false,
        "secret": "xnoPBzXtMeMyMHUVTgbuqAfg1SUTb",
        "tx_json": {
            "Account": "zHb9CJAWyB4zj91VRWn96DkukG4bwdtyTh",
            "Amount": "100000000",
            "Destination": "z9t6fxjiRMx7P5wTJEX65p6ys9JFxWSN93",
            "TransactionType": "Payment"
        }
    }]
}
' http://127.0.0.1:5005
```{{execute}}
返回结果中可以看到`"engine_result":"tesSUCCESS"`表示交易发送成功，返回结果最后一个字段是`hash`，它的值是当前发送交易的hash值

4. 执行命令 `./chainsqld account_info z9t6fxjiRMx7P5wTJEX65p6ys9JFxWSN93`{{execute}} 查看账户信息，可以看到余额正是我们激活交易中的`Amount`值