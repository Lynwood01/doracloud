<template>
  <el-container>
    <error-index>
      <div  slot="img" class="sorry_500"></div>
      <h2 slot="title"> 抱歉，你访问的页面暂时没有数据!</h2>
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
