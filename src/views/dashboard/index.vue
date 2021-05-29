<template>
  <div class="dashboard-container">
    <div class="dashboard-text">name: {{ name }}</div>
    <VideoJSRecord ref="video"/>
    <button @click="take">拍照</button>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import VideoJSRecord from './VideoRecord'
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
      img: ''
    }
  },
  computed: {
    ...mapGetters([
      'name'
    ])
  },
  mounted(){
      this.$refs.video.player.record().getDevice();
  },
  methods:{
    take(){
      this.$refs.video.take()
    }
  },
}
</script>

<style lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
</style>
