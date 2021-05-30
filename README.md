## 简介

[vue-element-admin-express](https://vue.bigfool.cn) 是一个后台前端解决方案，它基于 [vue](https://github.com/vuejs/vue) 和 [element-ui](https://github.com/ElemeFE/element)以及[express](https://www.expressjs.com.cn/)实现。它使用了最新的前端技术栈，内置了动态路由，权限验证，并提供了简单的后端API服务，开箱即用，帮助你快速构建前后端分离动态路由和权限模型。

本项目通过[vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)精简改造，移除了大部分组件，如需要其他组件，可前往搬运。

- [在线预览](https://vue.bigfool.cn)

## 前序准备

你需要在本地安装 [node](http://nodejs.org/) 、[git](https://git-scm.com/) 和 [mysql](https://www.mysql.com/)。本项目技术栈基于 [ES2015+](http://es6.ruanyifeng.com/)、[vue](https://cn.vuejs.org/index.html)、[vuex](https://vuex.vuejs.org/zh-cn/)、[vue-router](https://router.vuejs.org/zh-cn/) 、[vue-cli](https://github.com/vuejs/vue-cli) 、[axios](https://github.com/axios/axios) 、 [element-ui](https://github.com/ElemeFE/element) 和 [express](https://www.expressjs.com.cn/)，提前了解和学习这些知识会对使用本项目有很大的帮助。


## 功能

```
- 登录 / 注销

- 系统管理
  - 用户管理
  - 菜单管理
  - 角色管理
  - 登录日志
```

## 服务端

```bash
# 进入server端目录
cd vue-element-admin-express/server

# 安装依赖
npm install

# 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npm.taobao.org

# vue-element-admin-express/server/mysql.sql 导入数据表到mysql数据库
# vue-element-admin-express/server/model/init.js 配置数据库信息:数据库名，登录账号，登录密码，ip,端口

# 启动 默认绑定ip：0.0.0.0 端口：8002, 可以在app.js指定你需要的ip和端口
npm run start

```

接口地址：http://0.0.0.0:8002

## 服务端 -聊天室

需要具备golang运行环境和相关知识。
```bash
cd ./server_chat/src/chat
go build -o "chat.exe"
chat.exe
```
如果不需要聊天室，可以移除Chat.vue相关涉及文件，可达到移除聊天室。

## 前台

```bash
# 克隆项目
git clone https://github.com/bigfool-cn/vue-element-admin-express.git

# 进入项目目录
cd vue-element-admin-express

# 安装依赖
npm install

# 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npm.taobao.org

# 启动服务
npm run dev
```

浏览器访问 http://localhost:9527

## 发布

```bash
# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```

## docker构建
根目录下的Dockerfile将服务端和客户端打包到了一个镜像，客户端打包后的dist目录放到服务端express内作为静态文件目录，
借用node的http服务就可以启动客户端了，需要修改VUE_APP_BASE_API为"/"。
```bash
# 构建镜像
docker build -t vue-element-admin-express .

# 启动一个项目容器
docker run -it -p 8002:8002 vue-element-admin-express
```
浏览器访问 http://ip:8002就可以访问了

PS: 在线示例跑在改Dockerfile构建的容器中

## 其它

```bash
# 预览发布环境效果
npm run preview

# 预览发布环境效果 + 静态资源分析
npm run preview -- --report

# 代码格式检查
npm run lint

# 代码格式检查并自动修复
npm run lint -- --fix
```
