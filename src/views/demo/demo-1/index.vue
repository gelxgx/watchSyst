<template>
  <div class="app-container">
    <VideoJSRecord ref="video" :params="params" @base64="base64" />
    <button @click="take">拍照</button>
    <div class="notice-part">
      <el-card class="warming-card">
        <div slot="header" class="clearfix">
          <span>警告信息</span>
        </div>
        <span>暂无警报</span>
      </el-card>
      <el-card class="content-card">
        <div slot="header" class="clearfix">
          <span>公告</span>
        </div>
        <span>暂无公告</span>
      </el-card>
    </div>
  </div>
</template>

<script>
import VideoJSRecord from '../../../components/VideoRecordCheck'
import { faceCheck } from '@/api/system/face'
export default {
  name: 'Demo11',
  components: {
    VideoJSRecord
  },
  data() {
    return {
      params: {
        width: 400,
        height: 400
      }
    }
  },
  mounted() {
    this.$refs.video.player.record().getDevice()
  },
  methods: {
    take() {
      this.$refs.video.take()
    },
    base64(data) {
      const params = data.split(',')
      faceCheck({ img: params[1] }).then((res) => {
        console.log('res', res)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.notice-part {
  float: right;
  position: absolute;
  top: 20px;
  right: 30px;
  display: inline-block;
  width: 30%;
  height: 100%;
  margin-left: 10px;
}
.warming-card {
  width: 100%;
  height: 300px;
}
.content-card {
  margin-top: 40px;
  width: 100%;
  height: 240px;
}
</style>
