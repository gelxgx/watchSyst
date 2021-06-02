<template>
  <div class="app-container">
    <el-card class="video-card">
      <div slot="header" class="clearfix">
        <span>视频监控摄像头</span>
      </div>
      <VideoJSRecord ref="video" :params="params" @base64="base64" />
    </el-card>
    <!-- <button @click="take">拍照</button> -->
    <el-card class="content-card">
      <div slot="header" class="clearfix">
        <span>录像列表</span>
      </div>
      <div v-for="o in 4" :key="o" class="text item">
        {{ "列表内容 " + o }}
      </div>
    </el-card>
    <el-card class="click-part">
      <div slot="header" class="clearfix">
        <span>操作按钮</span>
      </div>
      <!-- <el-card class="click-card" shadow="hover">
        <img
          @click="start"
          class="click-icon"
          src="../../assets/start.png"
          alt=""
        />
        <span>开始</span>
      </el-card> -->
      <el-card class="click-card" shadow="hover">
        <img
          class="click-icon"
          src="../../assets/take.png"
          alt=""
          @click="take"
        >
        <span class="more">拍照</span>
      </el-card>
      <!-- <el-card class="click-card" shadow="hover" @click="close">
        <img class="click-icon" src="../../assets/over.png" alt="" />
        <span>关闭</span>
      </el-card> -->
      <el-card class="click-card" shadow="hover">
        <img
          class="click-icon"
          src="../../assets/download.png"
          alt=""
          @click="download"
        >
        <span class="more">下载</span>
      </el-card>
    </el-card>
  </div>
</template>

<script>
import VideoJSRecord from '../../components/VideoRecord'
// import { faceCheck } from "@/api/system/face";
export default {
  name: 'Demo11',
  components: {
    VideoJSRecord
  },
  data() {
    return {
      params: {
        width: 500,
        height: 500
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
    download() {
      this.$refs.video.download()
    }
  }
}
</script>

<style lang="scss" scoped>
.content-card {
  width: 800px;
  height: 350px;
  position: absolute;
  top: 20px;
  left: 40%;
}
.click-part {
  width: 800px;
  height: 200px;
  position: absolute;
  top: 415px;
  left: 40%;
}
.click-card {
  display: inline-block;
  width: 100px;
  height: 100px;
  margin-left: 150px;
  margin-right: 100px;
  .click-icon {
    position: relative;
    bottom: 10px;
    width: 50px;
    height: 50px;
    cursor: pointer;
  }
  span {
    display: inline-block;
    width: 70px;
    font-size: 14px;
    position: relative;
    bottom: 10px;
    left: 10px;
  }
}
.video-card {
  display: inline-block;
}
</style>
