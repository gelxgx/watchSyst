<template>
  <div class="dashboard-container">
    <div class="info-part">
      <el-card class="userInfo-card">
        <div slot="header" class="clearfix">
          <span>用户信息</span>
        </div>
        <!-- <div v-for="o in 4" :key="o" class="text item">
          {{ "列表内容 " + o }}
        </div> -->
        <h3>Hi,{{ name }}</h3>
        <span />
      </el-card>
      <el-card class="device-part">
        <div slot="header" class="clearfix">
          <span>设备信息</span>
        </div>
        <el-card class="device-card" shadow="hover">
          <img class="device-icon" src="../../assets/device.png" alt="">
          <span class="device-name">监控设备1</span>
          <el-switch
            v-model="deviceOpen"
            class="device-switch"
            active-text="启用"
            inactive-text="禁用"
          />
        </el-card>
        <el-card class="device-card" shadow="hover">
          <img class="device-icon" src="../../assets/device.png" alt="">
          <span class="device-name">监控设备2</span>
          <el-switch
            v-model="deviceOpen"
            class="device-switch"
            active-text="启用"
            inactive-text="禁用"
          />
        </el-card>
        <el-card class="device-card" shadow="hover">
          <img class="add-icon" src="../../assets/add.png" alt="">
          <span class="add-device">添加设备</span>
        </el-card>
      </el-card>
    </div>
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
import { mapGetters } from 'vuex'

export default {
  name: 'Dashboard',
  data() {
    return {
      chunks: [],
      chunkList: [],
      index: 0,
      options: {},
      isRecording: false,
      img: '',
      base64: '',
      deviceOpen: true
    }
  },
  computed: {
    ...mapGetters(['name'])
  },
  mounted() {
    // this.$refs.video.player.record().getDevice();
  },
  methods: {
    take() {
      this.$refs.video.take()
    }
  }
}
</script>

<style lang="scss" scoped>
.dashboard-container {
  // display:flex;
  // justify-content: space-between;
  margin-top: 20px;
}
.text {
  font-size: 14px;
}
.info-part {
  display: inline-block;
  width: 65%;
  height: 100%;
  margin-left: 20px;
}
.userInfo-card {
  width: 100%;
  height: 220px;
}
.device-part {
  margin-top: 60px;
  width: 100%;
  height: 300px;
}
.device-card {
  // margin-top: 60px;
  width: 200px;
  height: 200px;
  display: inline-block;
  .device-icon {
    width: 50px;
    height: 50px;
    position: relative;
    left: 50px;
  }
  .add-icon {
    width: 100px;
    height: 100px;
    position: relative;
    left: 20px;
  }
  .add-device {
    position: relative;
    display: inline-block;
    top: 20px;
    left: 40px;
  }
  .device-name {
    position: relative;
    top: 40px;
    right: 20px;
  }
  .device-switch {
    position: relative;
    left: 20px;
    top: 70px;
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
.item {
  padding: 18px 0;
}
.box-card {
  width: 340px;
}
</style>
