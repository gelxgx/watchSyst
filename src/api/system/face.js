import request from '@/utils/request'

export function faceCheck(params) {
  return request({
    url: '/face/checkFace',
    method: 'post',
    data: {
      ...params
    }
  })
}
