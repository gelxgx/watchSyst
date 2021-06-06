<template>
  <div class="app-container">
    <VideoJSRecord ref="video" :params="params" @base64="base64" />
    <canvas id="canvas" ref="canvas" class="canvas" width="400" height="300" />
    <el-card class="tool-part" shadow="hover">
      <div slot="header" class="clearfix">
        <span>人脸功能</span>
      </div>
      <el-card class="tool-card" shadow="hover">
        <i :class="shibie.icon" />
        <span>{{ shibie.type }}</span>
        <el-switch
          v-model="shibie.open"
          :disabled="shibie.disabled"
          active-color="#13ce66"
          inactive-color="#ff4949"
          @change="shibieCheck"
        />
      </el-card>
      <el-card class="tool-card" shadow="hover">
        <i :class="fenxi.icon" />
        <span>{{ fenxi.type }}</span>
        <el-switch
          v-model="fenxi.open"
          :disabled="fenxi.disabled"
          active-color="#13ce66"
          inactive-color="#ff4949"
          @change="fenxiCheck"
        />
      </el-card>
      <el-button
        plain
        class="face-btn"
        type="success"
        icon="el-icon-camera-solid"
        @click="updateFace"
      >人脸更新</el-button>
    </el-card>
    <el-card class="face-card" shadow="hover">
      <div slot="header" class="clearfix">
        <span>人脸信息</span>
      </div>
      <div :class="fenxi.open == false ? 'face-content' : ''">
        <span>年龄:{{ faceInfo.age }}</span>
        <el-divider />
        <span>性别:{{ faceInfo.gender }}</span>
        <el-divider />
        <span>颜值得分:{{ faceInfo.beauty }}分</span>
        <el-divider />
        <span>情绪:{{ faceInfo.emotion }}</span>
        <el-divider />
        <span>表情:{{ faceInfo.expression }}</span>
        <el-divider />
        <span>脸型:{{ faceInfo.face_shape }}</span>
        <el-divider />
        <span>是否佩戴眼镜:{{ faceInfo.glasses }}</span>
        <el-divider />
      </div>
      <div v-if="!fenxi.open" class="face-blur">
        <span>请先开启人脸信息分析功能！</span>
      </div>
    </el-card>
    <div class="notice-part">
      <el-card class="warming-card" shadow="hover">
        <div slot="header" class="clearfix">
          <span>警告信息</span>
        </div>
        <span v-if="warmingInfo.length == 0">暂无警报</span>
        <div v-else class="warmingInfo-part">
          <span
            v-for="item in warmingInfo"
            :key="item.key"
            class="warmingInfo"
            @click="warmingInfoCheck(item)"
          >{{ item.text }}</span>
        </div>
      </el-card>
      <el-dialog
        title="警告详情"
        :visible.sync="warmingInfoC.isShow"
        width="30%"
      >
        <span>{{ warmingInfoC.text }}，具体画面如下</span>
        <img
          style="width: 270px; height: 200px; margin-top: 20px"
          :src="warmingInfoC.img"
          alt=""
        >
        <span slot="footer" class="dialog-footer">
          <el-button
            type="primary"
            @click="warmingInfoC.isShow = false"
          >关 闭</el-button>
        </span>
      </el-dialog>
      <el-card class="content-card" shadow="hover">
        <div slot="header" class="clearfix">
          <span>公告</span>
        </div>
        <span v-if="contentInfo.length == 0">暂无公告</span>

        <div v-else class="contentInfo-part">
          <span
            v-for="item in contentInfo"
            :key="item.key"
            class="contentInfo"
          >{{ item.text }}</span>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import VideoJSRecord from '../../../components/VideoRecordCheck'
import { faceCheckMore, faceSearch, updateFaceUser } from '@/api/system/face'
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
      shibie: {
        type: '识别',
        open: false,
        icon: 'el-icon-video-camera',
        disabled: false
      },
      fenxi: {
        type: '分析',
        open: false,
        icon: 'el-icon-search',
        disabled: false
      },
      faceInfo: {
        age: '检测中...',
        beauty: '检测中...',
        emotion: '检测中...',
        expression: '检测中...',
        face_shape: '检测中...',
        gender: '检测中...',
        glasses: '检测中...'
      },
      warmingInfo: [],
      warmingInfoC: {
        isShow: false,
        text: '',
        img: ''
      },
      contentInfo: []
    }
  },
  computed: {
    ...mapGetters(['name', 'face_token', 'user_id'])
  },
  mounted() {
    this.$refs.video.player.record().getDevice()
  },
  methods: {
    take() {
      this.$refs.video.take()
    },
    base64(data, defData) {
      if (this.fenxi.open) {
        faceCheckMore({ img: data }).then((res) => {
          this.clearCanvas()
          this.makeFaceInfo(res.data.face_list[0])
          const url = res.data.face_list[0]
          const width = 40 + url.location.width
          const height = 130 + url.location.height
          const y = url.location.top
          const x = url.location.left
          this.content(x, y, width, height)
        })
      } else if (this.shibie.open) {
        faceSearch({ image: data }).then((res) => {
          const myDate = new Date()
          const mytime = myDate.toLocaleString()
          const score = res.data.result.user_list[0].score
          const name = res.data.result.user_list[0].user_id
          const image = defData
          // console.log(res.data.results.user_list[0].score);
          if (score < 70) {
            const info = {
              text: `${mytime}检测到一张异常人脸`,
              image: image
            }
            this.warmingInfo.push(info)
          } else {
            const info = {
              text: `${mytime}检测到用户${name}路过`
            }
            this.contentInfo.push(info)
          }
        })
      } else {
        updateFaceUser({
          image: data,
          userid: this.name,
          user_id: this.user_id
        }).then((res) => {
          console.log('res', res)
          this.$store.commit('user/SET_FACE_TOKEN', res.data)
          this.$message({
            type: 'success',
            message: '更新成功!'
          })
        })
      }
    },
    shibieCheck(data) {
      if (data) {
        this.shibie.type = '识别中'
        this.shibie.icon = 'el-icon-loading'
        this.fenxi.disabled = true
        this.shibieInterval = setInterval(() => {
          this.$refs.video.take()
        }, 2000)
        return
      }
      this.shibie.type = '识别'
      this.shibie.icon = 'el-icon-video-camera'
      this.fenxi.disabled = false
      clearInterval(this.shibieInterval)
      this.clearCanvas()
    },
    fenxiCheck(data) {
      if (data) {
        this.fenxi.type = '分析中'
        this.fenxi.icon = 'el-icon-loading'
        this.shibie.disabled = true
        this.fenxiInterval = setInterval(() => {
          this.$refs.video.take()
        }, 2000)
        return
      }
      this.fenxi.type = '分析'
      this.fenxi.icon = 'el-icon-search'
      this.shibie.disabled = false
      clearInterval(this.fenxiInterval)
      this.clearCanvas()
    },
    updateFace() {
      this.$confirm('此操作更新现有的人脸数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          this.$refs.video.take()
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: '已取消操作'
          })
        })
    },
    clearCanvas() {
      const canvas = this.$refs.canvas
      const ctx = canvas.getContext('2d')
      ctx.clearRect(0, 0, 400, 300)
    },
    content(x, y, width, height) {
      const canvas = this.$refs.canvas
      const ctx = canvas.getContext('2d')
      ctx.clearRect(0, 0, 400, 300)
      ctx.strokeStyle = 'yellow'
      ctx.lineWidth = 3
      ctx.strokeRect(x, y, width, height)
    },
    warmingInfoCheck(data) {
      this.warmingInfoC.isShow = true
      this.warmingInfoC.text = data.text
      this.warmingInfoC.img = data.image
    },
    makeFaceInfo(data) {
      this.faceInfo.age = data.age
      this.faceInfo.beauty = 50 + data.beauty
      this.faceInfo.emotion = this.emotion(data.emotion.type)
      this.faceInfo.expression = this.expression(data.expression.type)
      this.faceInfo.face_shape = this.face_shape(data.face_shape.type)
      this.faceInfo.gender = data.gender.type == 'male' ? '男性' : '女性'
      this.faceInfo.glasses = this.glasses(data.glasses.type)
    },
    emotion(data) {
      switch (data) {
        case 'angry':
          return '愤怒'
          break
        case 'disgust':
          return '厌恶'
        case 'fear':
          return '恐惧'
        case 'happy':
          return '高兴'
        case 'sad':
          return '伤心'
        case 'surprise':
          return '惊讶'
        case 'neutral':
          return '无情绪'
        default:
          return '未检测到表情'
          break
      }
    },
    expression(data) {
      switch (data) {
        case 'none':
          return '面无笑意'
          break
        case 'smile':
          return '面带微笑'
        case 'laugh':
          return '哈哈大笑'
        default:
          return '未检测到笑容'
          break
      }
    },
    face_shape(data) {
      switch (data) {
        case 'square':
          return '正方形脸'
          break
        case 'triangle':
          return '锥子脸'
        case 'oval':
          return '椭圆脸'
        case 'heart':
          return '心形脸'
        case 'round':
          return '圆脸'
        default:
          return '未检测到脸型'
          break
      }
    },
    glasses(data) {
      switch (data) {
        case 'none':
          return '未佩戴眼镜'
          break
        case 'common':
          return '普通眼镜'
        case 'sun':
          return '墨镜'
        default:
          return '未检测到眼镜'
          break
      }
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
    margin-right: 5px;
    width: 170px;
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
    filter: blur(5px);
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
  .warmingInfo-part {
    height: 200px;
    overflow: auto;
  }
  .warmingInfo {
    display: inline-block;
    margin-top: 10px;
    color: red;
    font-size: 14px;
    cursor: pointer;
  }
}
.content-card {
  margin-top: 40px;
  width: 100%;
  height: 240px;
  .contentInfo-part {
    height: 145px;
    overflow: auto;
  }
  .contentInfo {
    display: inline-block;
    margin-top: 10px;
    font-size: 14px;
  }
}
.canvas {
  position: absolute;
  top: 17px;
}
</style>
