<template>
  <div>
    <div class="error-box" >
      <img :src="errGif" alt="Girl has dropped her ice cream.">
    </div>
    <div>
      <el-button @click="back" icon='arrow-left' class="pan-back-btn">返回</el-button>
      <slot name="img">
      </slot>

      <div class="error-info">
        <slot name="title">

        </slot>
        <!--<h2> 抱歉，你访问的页面暂时没有数据!</h2>-->
        <ul class="list-unstyled">
          <li>或者你可以去:</li>
          <li class="link-type">
            <router-link to="/index">回首页</router-link>
          </li>
          <li class="link-type">
            <router-link to="/buy">去购买</router-link>
          </li>
          <li class="link-type">
            <router-link to="/info">个人中心</router-link>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<style>

  .pan-back-btn{
    position: absolute;
    top: 7%;
    left: 20%;
    background: #008489;
    color: #fff;
  }
  li,h2{
    padding-bottom: 5px;
  }
  .list-unstyled {
    font-size: 14px;
  }
  a {
    color: #008489;
    text-decoration: none;}
  a:hover {
    text-decoration: underline;
  }

</style>
<script>
  import "@/assets/css/common.css"
  import "@/assets/css/error.css"
  import errGif from '@/assets/image/error.gif'
  import errorPng from './../../../static/images/error.png'
  export default {
    data() {
      return {
        errGif: errGif + '?' + +new Date(),
        errorPng: errorPng,
        msg: '初始代模板'
      }
    },
    methods:{
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
