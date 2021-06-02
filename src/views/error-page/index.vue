<template>
  <div class="app-container">
    <VideoJSRecord ref="video" @base64="base64" />
    <button @click="take">拍照</button>
  </div>
</template>

<script>
import VideoJSRecord from '../../components/VideoRecord'
import { faceCheck } from '@/api/system/face'
export default {
  name: 'Demo11',
  components: {
    VideoJSRecord
  },
  mounted() {
    this.$refs.video.player.record().getDevice()
  },
  methods: {
    take() {
      this.$refs.video.take()
    },
    base64(data) {
      // console.log("data", data);
      const params = data.split(',')
      faceCheck({ img: params[1] }).then((res) => {
        console.log('res', res)
      })

      // axios({
      //   method: "post",
      //   url: "/api/face/checkFace",
      //   data: {
      //     img: data.split(",")[1],
      //   },
      // }).then(function (result) {
      //   console.log("result:", result);
      // });
    }
  }
}
</script>

<style scoped>
</style>
