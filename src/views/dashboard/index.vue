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
        <h3>Hi,{{ name }},{{ time }}</h3>
        <div class="tag">
          <el-tag type="success">共有{{ device.length }}设备</el-tag>
          <el-popover
            placement="bottom"
            title="faceToken"
            width="200"
            trigger="click"
            :content="face_token"
          >
            <el-tag
              slot="reference"
              class="checkToken"
              style="margin-left: 30px"
              type="info"
            >查看faceToken</el-tag>
          </el-popover>

          <el-tag style="margin-left: 30px" type="warning">视频监控中</el-tag>
          <el-tag
            style="margin-left: 30px"
            type="danger"
          >可进行人脸识别</el-tag>
          <el-tag style="margin-left: 30px">可进行人体识别</el-tag>
        </div>
        <span />
      </el-card>
      <el-card class="device-part">
        <div slot="header" class="clearfix">
          <span>设备信息</span>
        </div>

        <el-card
          v-for="item in device"
          :key="item.index"
          class="device-card"
          shadow="hover"
        >
          <img class="device-icon" src="../../assets/device.png" alt="">
          <span class="device-name">{{ item.name }}</span>
          <el-switch
            v-model="item.open"
            class="device-switch"
            active-text="启用"
            inactive-text="禁用"
          />
        </el-card>
        <el-card class="device-card" shadow="hover">
          <img
            class="add-icon"
            src="../../assets/add.png"
            alt=""
            @click="openAddDevice = true"
          >
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
    <el-dialog title="添加设备" :visible.sync="openAddDevice" width="30%">
      <el-form label-position="top" label-width="80px" :model="addDevice">
        <el-form-item label="设备名称">
          <el-input v-model="addDevice.name" />
        </el-form-item>
        <el-form-item label="设备是否开启">
          <el-switch
            v-model="addDevice.open"
            style="display: block"
            active-color="#13ce66"
            inactive-color="#ff4949"
            active-text="开启"
            inactive-text="关闭"
          />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="openAddDevice = false">取 消</el-button>
        <el-button type="primary" @click="checkAddDevice">确 定</el-button>
      </span>
    </el-dialog>
    <el-dialog
      title="人脸注册"
      :visible.sync="facecheck"
      width="30%"
      :close-on-click-modal="false"
      :close-on-press-escape="false"
      :show-close="false"
    >
      <span>为了保证能正确使用该系统，新用户必须进行人脸注册功能,</span>
      <span>请点击画面后，点击拍照，即可完成人脸注册</span>
      <VideoJSRecord
        ref="video"
        style="margin-top: 30px"
        :params="params"
        @base64="getBase"
      />
      <el-button
        style="margin-top: 30px"
        type="success"
        round
        @click="take"
      >拍照</el-button>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="updateFace">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { getUserFace, addFaceUser } from '@/api/system/face'
import { setTime } from '@/utils/time'
import VideoJSRecord from '../../components/VideoRecordCheck'
export default {
  name: 'Dashboard',
  components: {
    VideoJSRecord
  },
  data() {
    return {
      chunks: [],
      chunkList: [],
      index: 0,
      options: {},
      isRecording: false,
      img: '',
      base64: '',
      deviceOpen: true,
      time: setTime(),
      facecheck: false,
      params: {
        width: 200,
        height: 200
      },
      addDevice: {
        name: '',
        open: false
      },
      device: [],
      openAddDevice: false
    }
  },
  computed: {
    ...mapGetters(['name', 'face_token', 'user_id'])
  },
  mounted() {
    this.checkToken()
    // this.getUserFace();
  },
  methods: {
    getUserFace() {
      getUserFace({
        userid: this.name
      }).then((res) => {
        console.log('reS', res)
      })
    },
    checkToken() {
      if (!this.face_token) {
        this.facecheck = true
        // this.$refs.video.player.record().getDevice();
      }
    },
    updateFace() {
      if (!this.base64) {
        this.$message({
          message: '请先拍照获取人脸数据！',
          type: 'warning'
        })
        return
      }
      addFaceUser({
        image: this.base64,
        userid: this.name,
        user_id: this.user_id
      }).then((res) => {
        this.$store.commit('user/SET_FACE_TOKEN', res.data)
        this.$message({
          message: res.message,
          type: 'success'
        })
        this.facecheck = false
      })
    },
    take() {
      this.$refs.video.take()
    },
    getBase(data) {
      if (data) {
        this.$message({
          message: '拍照成功',
          type: 'success'
        })
        this.base64 = data
      }
    },
    checkAddDevice() {
      console.log(this.addDevice)
      const info = {}
      Object.assign(info, this.addDevice)
      this.device.push(info)
      this.$message({
        message: '添加设备成功',
        type: 'success'
      })
      this.openAddDevice = false
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
.tag {
  margin-top: 50px;
  .checkToken {
    cursor: pointer;
  }
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
    cursor: pointer;
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
