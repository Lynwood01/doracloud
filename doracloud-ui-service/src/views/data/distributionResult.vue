<template>
  <div class="main clearfix">
    <!--<nav-header></nav-header>-->
    <div class="pf-sc">
      <img src="/static/images/pf-sc.jpg" alt="分销提交成功">
      <span>您的分销已提交成功，请等待系统自动处理， </br>稍后可在<a class="my-pf" href="/distribution">我的分销</a>中查看具体结果。</span>
      <div class="g-btns">
        <a href= "/trafficDis" class="pf-btn pf2">继续分销</a>
        <a href="/distribution" class="pf-btn">返回我的分销</a>
      </div>
    </div>
    <!--<nav-footer></nav-footer>-->
  </div>
</template>

<script>
  import "@/assets/css/common.css"
  import"@/assets/css/data.css"
  import"@/assets/css/new.css"
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
  import MenuLeft from '@/components/common/left'
  import NavBread from '@/components/common/disBread'
    export default {
        data() {
            return {msg: '初始代模板'}
        },
      components:{
        NavHeader,
        NavFooter,
        MenuLeft,
        NavBread
      }
    }
</script>
