<template>
  <div class="contaniner">
  <!--<nav-header></nav-header>-->
  <div class="main clearfix">
    <!--<menu-left></menu-left>-->
    <div class="content">
      <nav-bread>
        <slot><a href="javascript:;">我的合同</a></slot>
      </nav-bread>
      <div id="tableList" class="wrapper con-td">

      </div>
      <div class="page" >

        <div style="clear:both;"></div>
      </div>
    </div>
  </div>
    <!--<nav-footer></nav-footer>-->
  </div>
</template>

<script>
  import '@/assets/css/common.css'
  import '@/assets/css/contract.css'
  import '@/assets/css/new.css'
  import '@/assets/css/selectordie/selectordie.css'
  import '@/assets/css/selectordie/selectordie_theme_01.css'
  import '@/assets/css/new.css'
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
  import MenuLeft from '@/components/common/left'
  import NavBread from '@/components/common/bread'
  export default {
    data() {
      return {msg: '商品列表'}
    },
    components:{
      NavHeader,
      NavFooter,
      MenuLeft,
      NavBread
    },
    methods:{
      jump(){
        // this.$router.push("/goods/details")
        this.$router.push({path:'/goods/details?orderId=123541'})
      }
    }
  }
</script>
