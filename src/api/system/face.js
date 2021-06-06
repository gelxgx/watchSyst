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

export function faceCheckMore(params) {
  return request({
    url: '/face/checkFaceMore',
    method: 'post',
    data: {
      ...params
    }
  })
}

export function faceSearch(params) {
  return request({
    url: '/face/faceSearch',
    method: 'post',
    data: {
      ...params
    }
  })
}

export function getUserFace(params) {
  return request({
    url: '/face/userFaceCheck',
    method: 'post',
    data: {
      ...params
    }
  })
}

export function addFaceUser(params) {
  return request({
    url: '/face/addFaceUser',
    method: 'post',
    data: {
      ...params
    }
  })
}

export function updateFaceUser(params) {
  return request({
    url: '/face/updateFaceUser',
    method: 'post',
    data: {
      ...params
    }
  })
}
export function deleteFaceUser(params) {
  return request({
    url: '/face/deleteFaceUser',
    method: 'post',
    data: {
      ...params
    }
  })
}
