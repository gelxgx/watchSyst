const express = require('express')
const router = express.Router()
const UsersModel = require('../model/users')
const AipFaceClient = require("baidu-aip-sdk").face;

// 设置APPID/AK/SK
const APP_ID = "24167179";
const API_KEY = "uWTRcNkBREoQu4PK0lSnWhom";
const SECRET_KEY = "L2EPehy7stEZ6G0oNQWPbiG9mASnrG6B";

// 新建一个对象，建议只保存一个对象调用服务接口
const client = new AipFaceClient(APP_ID, API_KEY, SECRET_KEY);

// 获取人脸分析数据
router.post('/checkFaceMore',(req,res,next) => {
    img = req.body.img
    const options = {
        face_field: 'age,beauty,expression,face_shape,gender,glasses,eye_status,emotion'
    }
    client.detect(img, 'BASE64',options).then(result => {
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

// 调用获取用户人脸信息
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
    const user_id = req.body.user_id
    client.addUser(image, 'BASE64', 'face', userid).then(result => {
        const faceToken = result.result.face_token
        const addFaceToken = UsersModel.addFaceToken(user_id,{face_token:faceToken})
        addFaceToken.then(ret => {
            if(ret) {
                return res.json({
                    code: 20000,
                    message:'添加人脸成功',
                    data: faceToken
                })
            }
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
// 调用人脸删除
router.post('/deleteFaceUser', (req, res, next)=> {
    const userid = req.body.userid
    const facetoken = req.body.facetoken
    client.faceDelete(userid, 'face', facetoken).then(result => {
        return res.json({
            code: 20000,
            message:'删除人脸成功',
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
    const user_id = req.body.user_id
    client.updateUser(image, 'BASE64', 'face', userid).then(result => {
        const faceToken = result.result.face_token
        const addFaceToken = UsersModel.addFaceToken(user_id,{face_token:faceToken})
        addFaceToken.then(ret => {
            if(ret) {
                return res.json({
                    code: 20000,
                    message:'添加人脸成功',
                    data: faceToken
                })
            }
        })
        // return res.json({
        //     code: 20000,
        //     message: '获取成功',
        //     data: result
        // })
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

// 调用人脸搜索
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