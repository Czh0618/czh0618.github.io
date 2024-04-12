---
title: performance-index
comments: true
toc: true
top: true
date: 2024-04-04 20:22:40
tags: [性能,指标]
categories:
---

### 简述
```
在开发测试网站时，一般都有几个指标来衡量系统的性能，其中吞吐量、并发数、QPS、TPS、有效吞吐量、吞吐率、网络流量等指标，接下来就这几种指标简单聊聊。
```

#### 吞吐量

* 引用维基百科的概念解释

![alt text](../img/performance/image.png)

* Web系统
```
在web系统中，吞吐量指单位时间内成功处理的请求数量，反应了系统的整体性能，高吞吐量意味着用户的体验更好，请求可以被更快速的处理和响应。
```
* AI大模型训练

```
在大模型训练中，吞吐量指单位时间内可以处理多少个训练步骤或样本，
```
* 数据库

```
在数据库这样的存储系统中，吞吐量指可以接受和写入存储的数据量或读取并返回到请求系统中的数据量，通常以每秒字节数(Bps)为单位。
```

* 吞吐量和什么有关
```
吞吐量一般和网络带宽有关，但是吞吐量必然低于带宽，最主要的还是和系统的性能有很大关系，一般低延迟的系统吞吐量必然也不低。
```
* 如何测试吞吐量

```
可以采用网络工具来检测，比如简单网络管理协议 （SNMP）、Windows Management Instrumentation （WMI）、tcpdump、Wireshark 等
```
* 参考

[1.TeachTarget throughput](https://www.techtarget.com/searchnetworking/definition/throughput)

[2.性能测试中吞吐量](https://aiops.com/news/post/33883.html)