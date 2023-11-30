# 使用 Node.js 官方提供的镜像作为基础镜像
FROM node:18-alpine as builder

# 安装依赖
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache python3 make g++

# 设置工作目录
WORKDIR /app

# 将 package.json 和 package-lock.json 复制到工作目录
COPY package*.json ./

# 安装依赖
RUN npm ci

# 将所有文件复制到工作目录中
COPY . .

# 编译 C++ 扩展
ENV NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
RUN npm install -g nopt node-gyp \
  && node-gyp configure build

# 创建新的阶段
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 从 builder 阶段复制 node_modules 文件夹和编译结果
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/build/Release/createShortUrl.node ./createShortUrl.node

# 将所有文件复制到工作目录中
COPY . .

# 暴露端口
EXPOSE 3000

# 启动应用
CMD ["npm", "run", "start"]