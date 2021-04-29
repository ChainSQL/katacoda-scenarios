链查询操作

先执行 `cd ~/chainsql/1`{{execute}}切换到chainsql节点的目录

1. 查询区块信息
- 可以执行 `./chainsqld ledger`{{execute}} 查看当前最新区块信息

- 可执行 `./chainsqld ledger 2`{{execute}} 指定区块号来查询区块信息

2. 查询交易信息
- 按账户查询 `./chainsqld account_tx zHb9CJAWyB4zj91VRWn96DkukG4bwdtyTh 1 100`{{execute}} 查询根账户在1-100区块之间的所有交易

- 按区块查询： `./chainsqld ledger_txs 2`{{execute}} 可以查询区块2上的交易数量，`./chainsqld ledger_txs 2 include_success include_failure`{{execute}}可以查询到区块2上成功或失败的交易hash

- 按交易hash查询 `./chainsqld tx tx_hash` 查询交易信息，注意将其中的tx_hash换成真正的交易hash