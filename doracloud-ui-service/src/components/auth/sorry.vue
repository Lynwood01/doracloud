<template>
  <el-container>
    <error-index>
      <div  slot="img" class="sorry"></div>
      <h2 slot="title"> 抱歉，发生了一个错误，请联系管理员!</h2>
    </error-index>
  </el-container>
</template>
<script>
  import ErrorIndex from './index'

  export default {
    data() {
      return {
        msg: '初始代模板'
      }
    },
    components:{
      ErrorIndex:ErrorIndex
    }
  }
</script>
