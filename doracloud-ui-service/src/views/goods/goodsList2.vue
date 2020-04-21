<template>
  <div>
    {{msg}}</br>
    <!--<span>{{$route.params.goodsId}}</span>-->
    <router-link to="/goods/cart">跳转到购物车</router-link></br>
    <router-link to="/goods/image">显示图片</router-link></br>
    <router-link to="/goods/title">显示标题</router-link></br>
    <router-link to="/goods/title">显示标题</router-link></br>
    <button @click="jump">跳转到我的订单</button>
    <div>
      <router-view></router-view>
    </div>
  </div>

</template>

<style>
  /* body {
       background-color: green;
   }*/
</style>

<script>
  export default {
    data() {
      return {msg: '商品列表'}
    },
    methods:{
      jump(){
        // this.$router.push("/goods/details")
        this.$router.push({path:'/goods/details?orderId=123541'})
      }
    }
  }
</script>
