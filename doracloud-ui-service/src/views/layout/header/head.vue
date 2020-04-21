<template>
  <div class="head">
    <div class="log">
      <img src="/static/images/logo.png" alt="流量后向经营系统"/>

    </div>
    <ul class="menu">
      <li><a href="javascript:;"><i class="menu-ico c1"></i>首页</a></li>
      <li><a href="javascript:;"><i class="menu-ico c2"></i>流量分销</a></li>
      <li><a href="javascript:;"><i class="menu-ico c3"></i>流量购买</a></li>
      <li><a href="javascript:;"><i class="menu-ico c4"></i>个人中心</a></li>
    </ul>
    <!--<v-if test="${not empty sessionScope.custId}">
      <div class="info" id="logined">
        <img src="/static/images/user_demo.jpg" alt="用户头像">
        <div class="info-right">
          <span class="username">${cust.custName}</span>
          <a class="logout" href="javascript: logout();">[退出]</a><br/>
          <span class="role">合作伙伴</span>
        </div>
      </div>
    </v-if>-->
    <!--<v-if test="${empty sessionScope.custId}">-->
    <div class="info" id="unlogin">
      <div class="login">
        <!-- 你好！<a id="login-btn" href="javascript:void(0);">请登录</a> -->
        <a class="small-rg" href="${ctx}/regist/regist.html">去注册</a>
        <a id="login-btn" class="small-login" href="javascript:;">登录</a>
      </div>
    </div>
    <!--</v-if>-->
  </div>
</template>

<style>
</style>

<script>
    export default {
        data() {
            return {msg: '初始代模板'}
        }
    }
</script>
