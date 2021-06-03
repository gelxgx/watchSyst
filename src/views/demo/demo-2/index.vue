<template>
  <div class="app-container">
    <VideoJSRecord ref="video" :params="params" @base64="base64" />
    <!-- <button @click="take">拍照</button> -->
    <el-card class="tool-part" shadow="hover">
      <div slot="header" class="clearfix">
        <span>人体功能</span>
      </div>
      <el-card class="tool-card" shadow="hover">
        <i class="el-icon-video-camera" />
        <span>识别</span>
        <el-switch
          v-model="value"
          active-color="#13ce66"
          inactive-color="#ff4949"
        />
      </el-card>
      <el-card class="tool-card" shadow="hover">
        <i class="el-icon-data-analysi" />
        <span>分析</span>
        <el-switch
          v-model="value"
          active-color="#13ce66"
          inactive-color="#ff4949"
        />
      </el-card>
      <el-button
        plain
        class="face-btn"
        type="success"
        icon="el-icon-camera-solid"
      >人脸录入</el-button>
    </el-card>
    <el-card class="face-card" shadow="hover">
      <div slot="header" class="clearfix">
        <span>人脸信息</span>
      </div>
      <div class="face-content">
        <span>人脸信息中文</span>
      </div>
      <div class="face-blur">
        <span>请先开启人脸信息分析功能！</span>
      </div>
    </el-card>
    <div class="notice-part">
      <el-card class="warming-card" shadow="hover">
        <div slot="header" class="clearfix">
          <span>警告信息</span>
        </div>
        <span>暂无警报</span>
      </el-card>
      <el-card class="content-card" shadow="hover">
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
        height: 300
      },
      value: false
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
.tool-part {
  position: relative;
  top: 20px;
  width: 400px;
  height: 260px;
  .tool-card {
    display: inline-block;
    margin-right: 25px;
    width: 150px;
  }
  .face-btn {
    position: relative;
    top: 20px;
    width: 150px;
    height: 50px;
  }
}
.face-card {
  width: 30%;
  height: 580px;
  position: absolute;
  top: 20px;
  left: 35%;

  .face-content {
    filter: blur(3px);
  }
  .face-blur {
    position: absolute;
    top: 75px;
    span {
      display: inline-block;
      position: relative;
      top: 200px;
      left: 50%;
      font-size: 14px;
    }
  }
}
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
