#!/bin/sh
wget https://github.com/ChainSQL/chainsqld/releases/download/v1.1.4-pop/chainsqld-linux-x64-1.1.4-pop.tar.gz
mkdir chainsql
tar zxvf chainsqld-linux-x64-1.1.4-pop.tar.gz -C chainsql
cd chainsql
wget http://chainsql.net/chainsql-cfgs.tar.gz
tar zxvf chainsql-cfgs.tar.gz
rm chainsql-cfgs.tar.gz chainsqld.cfg

