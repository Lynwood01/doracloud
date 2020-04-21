<template>
  <div class="contaniner">
  <!--<nav-header></nav-header>-->
  <div class="main clearfix">
    <!--<menu-left></menu-left>-->
    <div class="content">
      <nav-bread>
        <slot><a href="javascript:;">流量商品</a></slot>
      </nav-bread>
      <div class="wrapper">
        <ul class="">
          <!-- <li class="active">我的商品</li>
                      <li>商品查询</li>
                      <li>协议查询</li> -->
        </ul>
        <div class="inner">
          <div class="">
            <table class="table">
              <thead>
              <tr>
                <th>商品编号</th>
                <th>商品类型</th>
                <th>商品规格</th>
                <th>商品价格/元</th>
                <!-- 					                <th>状态</th> -->
                <!-- 					                <th>消费品ID</th> -->
              </tr>
              </thead>
              <tbody>


              </tbody>
            </table>
          </div>
        </div>
        <div class="page"></div>
      </div>
    </div>
  </div>
  <!--<nav-footer></nav-footer>-->
 </div>
</template>


<script>
  import '@/assets/css/common.css'
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
