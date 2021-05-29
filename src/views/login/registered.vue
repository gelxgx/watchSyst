<template>
  <el-dialog title="注册" :visible.sync="isShow" width="30%" @close="close">
    <el-form label-width="auto" :model="userInfo">
      <el-form-item label="用户名">
        <el-input v-model="userInfo.name"></el-input>
      </el-form-item>
      <el-form-item label="密码">
        <el-input v-model="userInfo.region"></el-input>
      </el-form-item>
      <!-- <el-form-item label="用户类型">
        <el-input v-model="userInfo.type"></el-input>
      </el-form-item> -->
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="close">取 消</el-button>
      <el-button type="primary" @click="close">确 定</el-button>
    </span>
  </el-dialog>
</template>

<script>
export default {
  name: "registered",
  props: {
    show: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      isShow: false,
      userInfo: {
        username: "",
        password: "",
      },
    };
  },
  watch: {
    show(oldV, newV) {
      this.isShow = oldV;
    },
  },
  methods: {
    close() {
      this.$emit("isShow", false);
    },
  },
};
</script>

<style>
</style>