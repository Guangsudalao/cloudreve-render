#!/bin/sh

## cloudreve配置
cat <<-EOF > /root/cloudreve/conf.ini
[System]
; 运行模式
Mode = master
; 监听端口
Listen = :${PORT}
; 是否开启 Debug
Debug = false
; Session 密钥, 一般在首次启动时自动生成
; 5201314的md5加密密文为723d505516e0c197e42a6be3c0af910e
; 搭配cloudreve.db 默认关闭注册 管理员为 admin@cloudreve.org / cloudreve@2020
SessionSecret = 7cF5vIg8XLKtFOLU2kFNgz6zAkDS8w2Lyw1qSlIkEAod5TewkKPqU9X9b4CtH3qS
; Hash 加盐, 一般在首次启动时自动生成
HashIDSalt = kfIWhhcteuRACDnXtgkilGDgOdI8c6j2Prn9lUzossrOZn1pi46SXb80XFAaKMF3
[Database]
Type = ${DB_TYPE}
Port = ${DB_PORT}
User = ${DB_USER}
Password = ${DB_PASSWORD}
Host = ${DB_HOST}
Name = 	${DB_NAME}
TablePrefix = ${DB_TABLEPREFIX}
[Redis]
Server = ${REDIS_SERVER}
Password = ${REDIS_PASSWORD}
DB = ${REDIS_DB}
EOF

## 运行
/root/aria2/trackers-list-aria2.sh
/root/cloudreve/cloudreve -c /root/cloudreve/conf.ini


