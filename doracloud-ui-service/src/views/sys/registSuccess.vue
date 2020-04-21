<template>
  <html>
  <!--<head>-->
    <!--<script type="text/javascript">-->
      <!--$(function(){-->
        <!--//页面跳转-->
        <!--(function(){-->
          <!--setInterval(setChange,1000);-->
          <!--var i=4;-->
          <!--function setChange(){-->
            <!--if(i <= 4){-->
              <!--$('.main-succ em').text(i);-->
              <!--if(i == 1){-->
                <!--window.location.href=ctx+'/index.html'-->
              <!--}-->
            <!--}-->
            <!--i&#45;&#45;;-->
          <!--}-->
        <!--})();-->

      <!--});-->
    <!--</script>-->
  <!--</head>-->
  <body>
  <div style="position: absolute; left: 700px;top: 200px">
    <font style="color: red;size: 10px">
    </font>
  </div>

  <!--header 结束-->
  <div class="main-succ">
    <i class="img-succ"></i>
    <p><em>5</em>秒后系统将自动跳转到 <router-link to='/index'>首页</router-link></p>
  </div>


  </body>
  </html>

</template>

<script>
  import  "@/assets/css/selectordie/selectordie.css"
  import  "@/assets/css/regist.css"
  import "@/assets/css/common.css"
  import "@/assets/css/index.css"
    export default {
        data() {
            return {msg: '初始代模板'}
        }
    }
</script>
