# 高性能的长短链接转换系统

**主要解决高并发场景下的长短链接转换问题，最高可支持 21 万亿条数据。**

[![codecov](https://codecov.io/github/Gausons/short-url/branch/master/graph/badge.svg?token=7TL9OF9X7Z)](https://codecov.io/github/Gausons/short-url)
## C++ Addon 编译
linux 环境: 需要安装 python3.0 以上，以及 gcc <br>
node-gyp configure build

## node 版本
v16.0.0 以上

## 单元测试
npm run test

## 项目启动
npm run dev

## 项目依赖

- redis 版本: docker pull redislabs/rebloom:latest

- postgres: docker pull postgres

## TODO
- 优先解决部署问题
  - 提供 docker-compose 部署脚本
  - 支持 helm
- 由于 node 本身存在的内存和性能问题，后续会提供一版 Golang 方案。
  node 服务作为短链生成器还是没有问题的，Golang 版本目前只打算作为转化器使用。
 