<template>
        <div class="error-info">
          <slot>

          </slot>
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
</template>

<style>
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
    }
  }
</script>
