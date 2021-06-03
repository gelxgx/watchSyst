const express = require('express')
const router = express.Router()
const AipFaceClient = require("baidu-aip-sdk").face;

// 设置APPID/AK/SK
const APP_ID = "24167179";
const API_KEY = "uWTRcNkBREoQu4PK0lSnWhom";
const SECRET_KEY = "L2EPehy7stEZ6G0oNQWPbiG9mASnrG6B";

// 新建一个对象，建议只保存一个对象调用服务接口
const client = new AipFaceClient(APP_ID, API_KEY, SECRET_KEY);

// 获取人脸数据
router.post('/checkFace',(req,res,next) => {
    img = req.body.img
    client.detect(img, 'BASE64').then(result => {
        // console.log(JSON.stringify(result));
        return res.json({
            code: 20000,
            message: '请求成功',
            data: result.result
        })
    }).catch(err => {
        // 如果发生网络错误
        return res.json({
            code: 40000,
            message: '获取失败',
            data: err
        })
    });
})

// 调用获取用户人脸列表
router.post('/userFaceCheck',(req,res,next) => {
    const userid = req.body.userid
    client.getUser(userid, 'face').then(result => {
        return res.json({
            code: 20000,
            message: '获取成功',
            data: result
        })
    }).catch(err => {
        // 如果发生网络错误
        return res.json({
            code: 40000,
            message: '获取失败',
            data: err
        })
    });
})

// 调用人脸注册
router.post('/addFaceUser',(req,res,next) => {
    const image = req.body.image;
    const userid = req.body.userid
    client.addUser(image, 'BASE64', 'face', userid).then(result => {
        return res.json({
            code: 20000,
            message: '获取成功',
            data: result
        })
    }).catch(err => {
        // 如果发生网络错误
        return res.json({
            code: 40000,
            message: '获取失败',
            data: err
        })
    });
})

// 调用人脸更新
router.post('/updateFaceUser',(req,res,next) => {
    const image = req.body.image;
    const userid = req.body.userid
    client.updateUser(image, 'BASE64', 'face', userid).then(result => {
        return res.json({
            code: 20000,
            message: '获取成功',
            data: result
        })
    }).catch(err => {
        // 如果发生网络错误
        return res.json({
            code: 40000,
            message: '获取失败',
            data: err
        })
    });
})

// 调用删除用户
router.post('/deletFaceUser',(req,res,next) => {
    const userid = req.body.userid
    client.deleteUser('face', userid).then(result => {
        return res.json({
            code: 20000,
            message: '获取成功',
            data: result
        })
    }).catch(err => {
        return res.json({
            code: 40000,
            message: '获取失败',
            data: err
        })
    });
})

// 调用人脸对比
router.post('/faceSearch', (req, res, next) => {
    const image = req.body.image;
    client.search(image, 'BASE64', 'face').then(result => {
        return res.json({
            code: 20000,
            message: '获取成功',
            data: result
        })
    }).catch(err => {
        // 如果发生网络错误
        return res.json({
            code: 40000,
            message: '获取失败',
            data: err
        })
    });
})

module.exports = router