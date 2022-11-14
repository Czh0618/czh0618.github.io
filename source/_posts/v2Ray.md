---
title: v2ray
date: 2022-11-14 11:36:05
tags: [bridge,梯子]
---

### v2ray使用
#### 简介

官网：https://www.v2ray.com
v2Ray（Project V）相对于Shadowsocks,支持更多协议 (Socks、HTTP、TLS、TCP、mKCP、WebSocket)，还有更为强大的路由功能，更像是个全能选手

#### 服务器(VPS)购买

这里我采用的是HostWinds，之前有选择购买搬瓦工，但是IP更换没有hostWinds方便，地址：https://clients.hostwinds.com/

当然，搬瓦工官方也出了自己搭建的v2Ray [Just My Socks](https://bwgjms.com/post/how-to-buy-justmysocks/)

#### 安装

输入下面的命令，然后按步骤操作

``` bash
bash <(curl -s -L https://git.io/v2ray.sh)
```


安装完成后，可以输入: v2Ray url 查看客户端需要配置的链接

#### BBR优化

#### 备注

当前使用的配置来自于：https://github.com/233boy/v2ray