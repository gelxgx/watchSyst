const express = require('express')
const path = require('path')
const app = express()
const expressJwt = require('express-jwt')
const bodyParser = require('body-parser')
const userRouter = require('./router/user')
const roleRouter = require('./router/role')
const menuRouter = require('./router/menu')
const logRouter = require('./router/user-log')
const faceRouter = require('./router/face')
const bodyRouter = require('./router/body')

const history = require('connect-history-api-fallback')
app.use(express.static(path.join(__dirname, 'dist')))
app.use(history())

app.use(expressJwt({
  secret: 'bigfool.cn' // 签名的密钥 或 PublicKey
}).unless({
  path: ['/', '/user/login'] // 指定路径不经过 Token 解析
}))

app.use(bodyParser.urlencoded({limit: '10mb', extended: true })); // for parsing application/x-www-form-urlencoded


app.use(bodyParser.json({limit: '10mb'}))

app.use(function(err, req, res, next) {
  console.log('eRR',err);
  if (err.name === 'UnauthorizedError') {
    res.status(401).send('token已失效')
  } else {
    res.status(500).send('服务器错误')
  }
})

//  使用路由 / 是路由指向名称
app.use('/user', userRouter)
app.use('/user-log', logRouter)
app.use('/role', roleRouter)
app.use('/menu', menuRouter)
app.use('/face', faceRouter)
app.use('/body', bodyRouter)

// 配置服务端口
// const port = 8002
// const hostname = '0.0.0.0'
// app.listen(port, hostname, () => {
//   console.log(`Server running at http://${hostname}:${port}/`)
// })
app.listen('8002',()=> {
  console.log('服务启动');
})
