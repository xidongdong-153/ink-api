# 使用Node.js官方镜像作为基础镜像
FROM node:20

# 定义工作目录
WORKDIR /usr/src/app

# 复制`package.json`和`pnpm-lock.yaml`到工作目录
COPY package.json pnpm-lock.yaml ./

# 安装pnpm
RUN npm install -g pnpm

# 安装项目依赖
RUN pnpm install --frozen-lockfile

# 将构建产物（dist目录）和其他必要文件复制到工作目录
COPY . .

# 构建应用（如果您已经在本地构建，可以跳过这步）
# RUN pnpm build

# 暴露容器将监听的端口
EXPOSE 3000

# 定义容器启动时执行的命令
CMD ["node", "dist/main"]
