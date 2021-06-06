import request from '@/utils/request'

export function checkBody (params) {
    return request({
        url: '/body/checkBody',
        method: 'post',
        data: {
            ...params
        }
    })
}

export function checkfinger (params) {
    return request({
        url:'/body/gesture',
        method: 'post',
        data:{ 
            ...params
        }
    })
}