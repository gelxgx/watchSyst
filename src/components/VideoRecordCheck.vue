<template>
  <video id="myVideo" playsinline class="video-js vjs-default-skin" />
</template>

<script>
/* eslint-disable */
import "video.js/dist/video-js.css";
import "videojs-record/dist/css/videojs.record.css";
import videojs from "video.js";
import "webrtc-adapter";
import RecordRTC from "recordrtc";
// the following imports are only needed when you're recording
// audio-only using the videojs-wavesurfer plugin
/*
    import WaveSurfer from 'wavesurfer.js';
    import MicrophonePlugin from 'wavesurfer.js/dist/plugin/wavesurfer.microphone.js';
    WaveSurfer.microphone = MicrophonePlugin;

    // register videojs-wavesurfer plugin
    import videojs_wavesurfer_css from 'videojs-wavesurfer/dist/css/videojs.wavesurfer.css';
    import Wavesurfer from 'videojs-wavesurfer/dist/videojs.wavesurfer.js';
    */

import Record from "videojs-record/dist/videojs.record.js";
export default {
  props: {
    params: {
      type: Object,
    },
  },
  data() {
    return {
      player: "",
      options: {
        controls: true,
        autoplay: false,
        fluid: false,
        loop: false,
        width: this.params.width,
        height: this.params.height,
        bigPlayButton: false,
        controlBar: {},
        plugins: {
          record: {
            maxLength: 600,
            audio: false,
            video: true,
            debug: true,
          },
        },
      },
    };
  },
  mounted() {
    /* eslint-disable no-console */
    this.player = videojs("#myVideo", this.options, () => {
      // print version information at startup
      var msg =
        "Using video.js " +
        videojs.VERSION +
        " with videojs-record " +
        videojs.getPluginVersion("record") +
        " and recordrtc " +
        RecordRTC.version;
      videojs.log(msg);
    });

    // device is ready
    this.player.on("deviceReady", () => {
      console.log("device is ready!");
    });

    // user clicked the record button and started recording
    this.player.on("startRecord", () => {
      console.log("started recording!");
    });

    // user completed recording and stream is available
    this.player.on("finishRecord", () => {
      // the blob object contains the recorded data that
      // can be downloaded by the user, stored on server etc.
      console.log("finished recording: ", this.player.recordedData);
    });

    // error handling
    this.player.on("error", (element, error) => {
      console.warn(error);
    });

    this.player.on("deviceError", () => {
      console.error("device error:", this.player.deviceErrorCode);
    });
    this.player.on("timestamp", () => {
      // timestamps
      console.log("current timestamp: ", this.player.currentTimestamp);
      console.log("all timestamps: ", this.player.allTimestamps);

      // stream data
      console.log("array of blobs: ", this.player.recordedData);
      // or construct a single blob:
      // var blob = new Blob(blobs, {
      //     type: 'video/webm'
      // });
    });
    this.player.on("finishRecord", function () {
      // show save as dialog
      this.player.record().saveAs({ video: "my-video-file-name.webm" });
    });
  },
  methods: {
    take() {
      this.player
        .record()
        .exportImage()
        .then((res) => {
          let blob = res;
          this.blobToBase64(blob, (res) => {
            let base64 = res.split(",");
            this.$emit("base64", base64[1], res);
          });
        });
    },
    blobToBase64(blob, callback) {
      let fileReader = new FileReader();
      fileReader.onload = function (e) {
        callback && callback(e.target.result);
      };
      fileReader.readAsDataURL(blob);
    },
  },
  beforeDestroy() {
    if (this.player) {
      this.player.dispose();
    }
  },
};
</script>
<style lang="scss" scoped>
</style>
