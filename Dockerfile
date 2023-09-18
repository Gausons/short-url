# 使用 Node.js 官方提供的镜像作为基础镜像
FROM node:14-alpine

# 安装依赖
RUN apk add --no-cache python make g++

# 设置工作目录
WORKDIR /app

# 将 package.json 和 package-lock.json 复制到工作目录
COPY package*.json ./

# 安装依赖
RUN npm install

# 将所有文件复制到工作目录中
COPY . .

# 编译 C++ 扩展
RUN npm install -g node-gyp \
 && node-gyp configure \
 && node-gyp build

# 将编译结果添加到容器中
COPY build/Release/createShortUrl.node ./createShortUrl.node

# 暴露端口
EXPOSE 3000

# 启动应用
CMD npm run 
