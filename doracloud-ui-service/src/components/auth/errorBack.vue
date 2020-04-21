<template>
      <el-button @click="back" icon='arrow-left' class="pan-back-btn">返回</el-button>
</template>
<style>
  .pan-back-btn{
    position: absolute;
    top: 7%;
    left: 20%;
    background: #008489;
    color: #fff;
  }

</style>
<script>
  export default {
    data() {
      return {
        msg: '初始代模板'
      }
    },methods: {
      back() {
        if (this.$route.query.noGoBack) {
          this.$router.push({ path: '/index' })
        } else {
          this.$router.go(-1)
        }
      }
    }
  }
</script>
