<template>
  <div>
    <el-card class="box-card">
      <div v-for="o in 4" :key="o" class="text item">
        {{ "列表内容 " + o }}
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  data() {
    return {}
  }
}
</script>
<style lang='scss' scoped>
.box-card {
  width: 150px;
  height: 100px;
}
</style>
