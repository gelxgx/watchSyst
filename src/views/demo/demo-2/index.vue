<template>
  <div class="app-container">
    <VideoJSRecord ref="video" :params="params" @base64="base64" />
    <canvas id="canvas" ref="canvas" class="canvas" width="500" height="350" />
    <el-card class="tool-part" shadow="hover">
      <div slot="header" class="clearfix">
        <span>人体功能</span>
      </div>
      <el-card class="tool-card" shadow="hover">
        <i class="el-icon-video-camera" />
        <span>人体识别</span>
        <el-switch
          v-model="bodyshibie.open"
          :disabled="bodyshibie.disable"
          class="switch"
          active-color="#13ce66"
          inactive-color="#ff4949"
          active-text="开启"
          @change="bodyshibieCheck"
        />
      </el-card>
      <el-card class="tool-card" shadow="hover">
        <i class="el-icon-search" />
        <span>人体分析</span>
        <el-switch
          v-model="bodyfenxi.open"
          :disabled="bodyfenxi.disable"
          class="switch"
          active-color="#13ce66"
          inactive-color="#ff4949"
          active-text="开启"
          @change="bodyfenxiCheck"
        />
      </el-card>
      <el-card class="tool-card" shadow="hover">
        <i class="el-icon-thumb" />
        <span>手势识别</span>
        <el-switch
          v-model="fingershibie.open"
          :disabled="fingershibie.disable"
          class="switch"
          active-color="#13ce66"
          inactive-color="#ff4949"
          active-text="开启"
          @change="fingershibieCheck"
        />
      </el-card>
      <el-card class="tool-card" shadow="hover">
        <i class="el-icon-data-line" />
        <span>危险行为预测</span>
        <el-switch
          v-model="yuce.open"
          :disabled="yuce.disable"
          class="switch"
          active-color="#13ce66"
          inactive-color="#ff4949"
          active-text="开启"
          @change="yuceCheck"
        />
        <el-switch
          v-model="yuce.still"
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
      <div
        class="body-content"
        :class="bodyfenxi.open === false ? 'face-content' : ''"
      >
        <span>年龄：{{ bodyInfo.age }}</span>
        <el-divider />
        <span>性别：{{ bodyInfo.gender }}</span>
        <el-divider />
        <span
          >上身着装：{{
            bodyInfo.upper_wear +
            bodyInfo.upper_wear_texture +
            bodyInfo.upper_wear_fg
          }}</span
        >
        <el-divider />
        <span>下身着装：{{ bodyInfo.lower_wear }}</span>
        <el-divider />
        <span>是否背包：{{ bodyInfo.bag }}</span>
        <el-divider />
        <span>是否带帽子：{{ bodyInfo.headwear }}</span>
        <el-divider />
        <span>是否戴口罩：{{ bodyInfo.face_mask }}</span>
        <el-divider />
        <span>是否戴眼镜：{{ bodyInfo.glasses }}</span>
        <el-divider />
        <span>是否撑伞：{{ bodyInfo.umbrella }}</span>
        <el-divider />
        <span>是否使用手机:{{ bodyInfo.cellphone }}</span>
        <el-divider />
        <span>是否吸烟：{{ bodyInfo.smoke }}</span>
        <el-divider />
        <span>是否有手提物品：{{ bodyInfo.carrying_item }}</span>
        <el-divider />
        <span>是否有交通工具：{{ bodyInfo.vehicle }}</span>
        <el-divider />
        <span>身体朝向：{{ bodyInfo.orientation }}</span>
        <el-divider />
      </div>
      <div v-if="!bodyfenxi.open" class="face-blur">
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
        <span v-if="fingerInfo.length == 0">暂无公告</span>
        <div v-else class="contentInfo-part">
          <span
            v-for="item in fingerInfo"
            :key="item.key"
            class="contentInfo"
            @click="fingerInfoMore(item)"
            >发现一个{{ item.type }}手势</span
          >
        </div>
      </el-card>
      <el-dialog
        title="警告详情"
        :visible.sync="fingerInfoM.isShow"
        width="30%"
      >
        <span>发现一个{{ fingerInfoM.text }}手势，具体画面如下</span>
        <img
          style="width: 270px; height: 200px; margin-top: 20px"
          :src="fingerInfoM.img"
          alt=""
        />
        <span slot="footer" class="dialog-footer">
          <el-button type="primary" @click="fingerInfoM.isShow = false"
            >关 闭</el-button
          >
        </span>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import VideoJSRecord from "../../../components/VideoRecordCheck";
import { checkBody, checkfinger } from "@/api/system/body";
export default {
  name: "Demo11",
  components: {
    VideoJSRecord,
  },
  data() {
    return {
      params: {
        width: 500,
        height: 350,
      },

      bodyshibie: {
        open: false,
        disable: false,
      },
      bodyfenxi: {
        open: false,
        disable: false,
      },
      fingershibie: {
        open: false,
        disable: false,
      },
      yuce: {
        open: false,
        disable: false,
        still: true,
      },
      bodyInfo: {
        age: "检测中...",
        gender: "检测中...",
        upper_wear: "检测中...",
        upper_wear_fg: "",
        upper_wear_texture: "",
        lower_wear: "检测中...",
        bag: "检测中...",
        headwear: "检测中...",
        face_mask: "检测中...",
        glasses: "检测中...",
        umbrella: "检测中...",
        cellphone: "检测中...",
        smoke: "检测中...",
        carrying_item: "检测中...",
        vehicle: "检测中...",
        orientation: "检测中...",
      },
      fingerInfo: [],
      fingerInfoM: {
        isShow: false,
        text: "",
        img: "",
      },
    };
  },
  mounted() {
    this.$refs.video.player.record().getDevice();
  },
  methods: {
    take() {
      this.$refs.video.take();
    },
    base64(data, resData) {
      if (this.bodyfenxi.open === true || this.bodyshibie.open === true) {
        checkBody({ image: data }).then((res) => {
          if (this.bodyfenxi.open === true) {
            this.makeBodyInfo(res.data.person_info[0].attributes);
          }
          this.clearCanvas();
          const url = res.data.person_info[0];
          const width = 40 + url.location.width;
          const height = 130 + url.location.height;
          const y = 50 + url.location.top;
          const x = 20 + url.location.left;
          this.content(x, y, width, height);
        });
      } else if (this.fingershibie.open === true) {
        checkfinger({ image: data }).then((res) => {
          this.clearCanvas();
          if (res.data.length !== 1) {
            for (let i = 0; i < res.data.length; i++) {
              if (res.data[i].classname !== "Face") {
                const url = res.data[i];
                this.fingerInfoCheck(url.classname, resData);
                const width = url.width;
                const height = url.height;
                const y = 80 + url.top;
                const x = 30 + url.left;
                this.content(x, y, width, height);
              }
            }
          }
          console.log("res", res);
        });
      }
    },
    bodyshibieCheck(data) {
      if (data) {
        this.bodyfenxi.disable = true;
        this.fingershibie.disable = true;
        this.yuce.disable = true;
        this.shibieInterval = setInterval(() => {
          this.$refs.video.take();
        }, 2000);
        return;
      }
      this.bodyfenxi.disable = false;
      this.fingershibie.disable = false;
      this.yuce.disable = false;
      clearInterval(this.shibieInterval);
      this.clearCanvas();
    },
    bodyfenxiCheck(data) {
      if (data) {
        this.bodyshibie.disable = true;
        this.fingershibie.disable = true;
        this.yuce.disable = true;
        this.shibieInterval = setInterval(() => {
          this.$refs.video.take();
        }, 2000);
        return;
      }
      this.bodyshibie.disable = false;
      this.fingershibie.disable = false;
      this.yuce.disable = false;
      clearInterval(this.shibieInterval);
      this.clearCanvas();
    },
    fingershibieCheck(data) {
      if (data) {
        this.bodyshibie.disable = true;
        this.bodyfenxi.disable = true;
        this.yuce.disable = true;
        this.shibieInterval = setInterval(() => {
          this.$refs.video.take();
        }, 2000);
        return;
      }
      this.bodyshibie.disable = false;
      this.bodyfenxi.disable = false;
      this.yuce.disable = false;
      clearInterval(this.shibieInterval);
      this.clearCanvas();
    },
    yuceCheck(data) {
      if (data) {
        this.bodyshibie.disable = true;
        this.bodyfenxi.disable = true;
        this.fingershibie.disable = true;
        // this.$refs.video.take();
        return;
      }
      this.bodyshibie.disable = false;
      this.bodyfenxi.disable = false;
      this.fingershibie.disable = false;
    },
    clearCanvas() {
      const canvas = this.$refs.canvas;
      const ctx = canvas.getContext("2d");
      ctx.clearRect(0, 0, 500, 350);
    },
    content(x, y, width, height) {
      const canvas = this.$refs.canvas;
      const ctx = canvas.getContext("2d");
      ctx.clearRect(0, 0, 500, 350);
      ctx.strokeStyle = "yellow";
      ctx.lineWidth = 3;
      ctx.strokeRect(x, y, width, height);
    },
    makeBodyInfo(data) {
      this.bodyInfo.age = data.age.name;
      this.bodyInfo.gender = data.gender.name;
      this.bodyInfo.upper_wear = data.upper_wear.name;
      this.bodyInfo.upper_wear_fg = data.upper_wear_fg.name;
      this.bodyInfo.upper_wear_texture = data.upper_wear_texture.name;
      this.bodyInfo.lower_wear = data.lower_wear.name;
      this.bodyInfo.bag = data.bag.name;
      this.bodyInfo.headwear = data.headwear.name;
      this.bodyInfo.face_mask = data.face_mask.name;
      this.bodyInfo.glasses = data.glasses.name;
      this.bodyInfo.umbrella = data.umbrella.name;
      this.bodyInfo.cellphone = data.cellphone.name;
      this.bodyInfo.smoke = data.smoke.name;
      this.bodyInfo.carrying_item = data.carrying_item.name;
      this.bodyInfo.vehicle = data.vehicle.name;
      this.bodyInfo.orientation = data.orientation.name;
    },
    fingerInfoCheck(data, image) {
      let info = {
        type: this.fingerType(data),
        image: image,
      };
      this.fingerInfo.push(info);
    },
    fingerInfoMore(data) {
      this.warmingInfoC.isShow = true;
      this.warmingInfoC.text = data.text;
      this.warmingInfoC.img = data.image;
    },
    fingerType(data) {
      switch (data) {
        case "One":
          return "数字1";
        case "Five":
          return "数字5";
        case "Fist":
          return "拳头";
        case "OK":
          return "OK";
        case "Prayer":
          return "祈祷";
        case "Congratulation":
          return "作揖";
        case "Honour":
          return "作别";
        case "Heart_single":
          return "单手比心";
        case "Thumb_up":
          return "点赞";
        case "Thumb_down":
          return "Diss";
        case "ILY":
          return "Rock";
        case "Palm_up":
          return "掌心向上";
        case "Heart_1":
          return "双手比心";
        case "Heart_2":
          return "双手比心";
        case "Heart_3":
          return "双手比心";
        case "two":
          return "数字2";
        case "three":
          return "数字3";
        case "four":
          return "数字4";
        case "six":
          return "数字6";
        case "seven":
          return "数字7";
        case "eight":
          return "数字8";
        case "nine":
          return "数字9";
        case "Rock":
          return "Rock";
        case "Insult":
          return "竖中指";
        default:
          return "未检测到手势";
          break;
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.tool-part {
  position: relative;
  top: 20px;
  width: 975px;
  height: 210px;
  .tool-card {
    display: inline-block;
    margin-right: 25px;
    margin-left: 20px;
    width: 160px;
    height: 120px;
    .switch {
      margin-top: 15px;
    }
    .switch-t {
      margin-top: 5px;
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
  .body-content {
    font-size: 14px;
    height: 250px;
    overflow: auto;
  }
  .face-content {
    filter: blur(5px);
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
