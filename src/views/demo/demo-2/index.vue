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
        <span>人体识别</span>
        <el-switch
          v-model="value"
          class="switch"
          active-color="#13ce66"
          inactive-color="#ff4949"
          active-text="开启"
        />
      </el-card>
      <el-card class="tool-card" shadow="hover">
        <i class="el-icon-search" />
        <span>人体分析</span>
        <el-switch
          v-model="value"
          class="switch"
          active-color="#13ce66"
          inactive-color="#ff4949"
          active-text="开启"
        />
      </el-card>
      <el-card class="tool-card" shadow="hover">
        <i class="el-icon-thumb" />
        <span>手势识别</span>
        <el-switch
          v-model="value"
          class="switch"
          active-color="#13ce66"
          inactive-color="#ff4949"
          active-text="开启"
        />
      </el-card>
      <el-card class="tool-card" shadow="hover">
        <i class="el-icon-data-line" />
        <span>危险行为预测</span>
        <el-switch
          v-model="value"
          class="switch"
          active-color="#13ce66"
          inactive-color="#ff4949"
          active-text="开启"
        />
        <el-switch
          v-model="value2"
          class="switch-t"
          style="display: block"
          active-color="#13ce66"
          inactive-color="#ff4949"
          active-text="持续开启"
        />
      </el-card>
    </el-card>
    <el-card class="face-card" shadow="hover">
      <div slot="header" class="clearfix">
        <span>人体信息</span>
      </div>
      <div class="face-content">
        <span>人脸信息中文</span>
      </div>
      <div class="face-blur">
        <span>请先开启人体属性检测功能！</span>
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
        width: 500,
        height: 350
      },
      value: false,
      value2: false
    }
  },
  mounted() {
    // this.$refs.video.player.record().getDevice()
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
  width: 1100px;
  height: 210px;
  .tool-card {
    display: inline-block;
    margin-right: 25px;
    margin-left: 50px;
    width: 160px;
    height:120px;
    .switch{
      margin-top: 15px;
    }
    .switch-t {
      margin-top:5px;
    }
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
  height: 350px;
  position: absolute;
  top: 20px;
  left: 45%;

  .face-content {
    filter: blur(3px);
  }
  .face-blur {
    position: absolute;
    top: 75px;
    span {
      display: inline-block;
      position: relative;
      top: 100px;
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
  width: 20%;
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
