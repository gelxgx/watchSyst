<template>
  <div class="app-container">
    <el-card class="video-card">
      <div slot="header" class="clearfix">
        <span>视频监控摄像头</span>
      </div>
      <VideoJSRecord
        ref="video"
        :params="params"
        @recordedData="getRecordedData"
      />
    </el-card>
    <!-- <button @click="take">拍照</button> -->
    <el-card class="content-card">
      <div slot="header" class="clearfix">
        <span>录像列表</span>
      </div>
      <el-table :data="recordedData" height="250" style="width: 100%">
        <el-table-column label="时间" width="220">
          <template slot-scope="scope">
            <i class="el-icon-time" />
            <span style="margin-left: 10px">{{ scope.row.lastModified }}</span>
          </template>
        </el-table-column>
        <el-table-column label="文件" width="220">
          <template slot-scope="scope">
            <el-tag size="medium">{{ scope.row.name }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button
              size="mini"
              @click="handleEdit(scope.$index, scope.row)"
            >下载</el-button>
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>
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
import { readBlobToDownload } from '../../utils/blob'
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
      },
      recordedData: [],
      allTimestamps: [],
      tableData: [
        {
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        },
        {
          date: '2016-05-04',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1517 弄'
        },
        {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄'
        },
        {
          date: '2016-05-03',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1516 弄'
        }
      ]
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
    },
    getRecordedData(data) {
      console.log('recordedData', data)
      this.recordedData = data
    },
    handleEdit(index, row) {
      readBlobToDownload(row)
    },
    handleDelete(index, row) {
      this.recordedData.splice(index, 1)
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
