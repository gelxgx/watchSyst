const express = require('express')
const router = express.Router()
const AipBodyAnalysisClient = require("baidu-aip-sdk").bodyanalysis;

// 设置APPID/AK/SK
const APP_ID = "24167179";
const API_KEY = "uWTRcNkBREoQu4PK0lSnWhom";
const SECRET_KEY = "L2EPehy7stEZ6G0oNQWPbiG9mASnrG6B";

// 新建一个对象，建议只保存一个对象调用服务接口
const client = new AipBodyAnalysisClient(APP_ID, API_KEY, SECRET_KEY);

module.exports = router