<template>
  <div class="dashboard-container">
    <div class="info-part">
      <el-card class="userInfo-card">
        <div slot="header" class="clearfix">
          <span>用户信息</span>
        </div>
        <div v-for="o in 4" :key="o" class="text item">
          {{ "列表内容 " + o }}
        </div>
      </el-card>
      <el-card class="device-card">
        <div slot="header" class="clearfix">
          <span>设备信息</span>
        </div>
        <div v-for="o in 4" :key="o" class="text item">
          {{ "列表内容 " + o }}
        </div>
      </el-card>
    </div>
    <div class="notice-part">
      <el-card class="warming-card">
        <div slot="header" class="clearfix">
          <span>警告信息</span>
        </div>
        <div v-for="o in 4" :key="o" class="text item">
          {{ "列表内容 " + o }}
        </div>
      </el-card>
      <el-card class="content-card">
        <div slot="header" class="clearfix">
          <span>公告</span>
        </div>
        <div v-for="o in 4" :key="o" class="text item">
          {{ "列表内容 " + o }}
        </div>
      </el-card>
    </div>

    <!-- <button @click="take">拍照</button> -->
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
      base64: ''
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
  height: 400px;
}
.device-card {
  margin-top: 60px;
  width: 100%;
  height: 300px;
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
  height: 420px;
}
.item {
  padding: 18px 0;
}
.box-card {
  width: 340px;
}
</style>
