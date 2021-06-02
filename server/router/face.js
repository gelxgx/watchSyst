const express = require('express')
const router = express.Router()
const AipFaceClient = require("baidu-aip-sdk").face;

// 设置APPID/AK/SK
const APP_ID = "24167179";
const API_KEY = "uWTRcNkBREoQu4PK0lSnWhom";
const SECRET_KEY = "L2EPehy7stEZ6G0oNQWPbiG9mASnrG6B";

// 新建一个对象，建议只保存一个对象调用服务接口
const client = new AipFaceClient(APP_ID, API_KEY, SECRET_KEY);


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
        console.log(err);
        return err
    });
})

module.exports = router