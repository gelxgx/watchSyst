const express = require('express')
const router = express.Router()
const AipBodyAnalysisClient = require("baidu-aip-sdk").bodyanalysis;

// 设置APPID/AK/SK
const APP_ID = "24167179";
const API_KEY = "uWTRcNkBREoQu4PK0lSnWhom";
const SECRET_KEY = "L2EPehy7stEZ6G0oNQWPbiG9mASnrG6B";

// 新建一个对象，建议只保存一个对象调用服务接口
const client = new AipBodyAnalysisClient(APP_ID, API_KEY, SECRET_KEY);

// 调用人体检测与属性识别
router.post('/checkBody', (req, res, next) =>  {
    const image = req.body.image;
    client.bodyAttr(image).then(result => {
        return res.json({
            code: 20000,
            message: '请求成功',
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

// 调用手势识别 
router.post('/gesture',(req, res, next) => {
    const image = req.body.image;
    client.gesture(image).then(result => {
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





module.exports = router