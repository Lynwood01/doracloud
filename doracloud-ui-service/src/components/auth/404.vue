<template>
  <el-container>
   <error-index>
     <div  slot="img" class="sorry_404"></div>
     <h2 slot="title"> 抱歉，没有找到你访问的地址!</h2>
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
