<template>
      <div class="error-box" >
        <img :src="errGif" alt="Girl has dropped her ice cream.">
      </div>
</template>
<script>
  import "@/assets/css/common.css"
  import "@/assets/css/error.css"
  import errGif from '@/assets/image/error.gif'
  import errorPng from './../../../static/images/error.png'
  export default {
    data() {
      return {
        errGif: errGif + '?' + +new Date(),
        msg: '初始代模板'
      }
    }
  }
</script>
