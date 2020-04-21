<template>
    <div>
      <div class="login_main">
        <div id="firstpage" style=" width: 300px; height: 50px; float: left;"></div>
        <div class="login_form">
          <div id="errors" class="errtips"></div>
          <form id="loginForm" method="post" action="${ctx}/login/login.html">
            <div class="frow loginname">
              <input id="username" name="username" class="finput required" type="text" placeholder="请输入用户名">
            </div>
            <div class="frow psw">
              <input id="password" name="password" class="finput required" type="password" placeholder="请输入密码">
            </div>
            <div class="cd">
              <div class="frow code small">
                <input id="validateCode" name="validateCode" class="finput required" type="text" placeholder="请输入验证码">
              </div>
              <img src="/static/images/code.jpg" alt="验证码" id="validateImg" style="float:right;width:100px;height:42px;margin-left:7px;" onclick="changeValidateCode(this);">
             <!-- <div class="fl refresh">
                <a class="refresh_btn" href="javascript:changeValidateCode(document.getElementById('validateImg'));">换一张</a>
              </div>-->
            </div>
            <div>
            <a href="javascript:;" @click="login;" class="submit" id="loginBtn">登录</a>
              <!--<router-link to="/index" class="submit" style="width:320px;display: block;text-align: center;text-decoration: none;">登录</router-link>-->
            </div>
              <!-- 				<input class="submit" type="button" value="登录" id="loginBtn" onclick="javascript: login();"> -->
          </form>
        </div>
      </div>
      <div class="login_footer"></div>
     <!-- <script type="text/javascript" src="${ctxStatic}/jquery-validation/1.14.0/dist/jquery.validate.js"></script>
      <script type="text/javascript" src="${ctxStatic}/jquery-validation/1.14.0/dist/localization/messages_cn.js"></script>
      <script type="text/javascript" src="${ctxStatic}/jquery-validation/1.14.0/dist/jquery.metadata.js"></script>
      <script type="text/javascript" src="${ctxStatic}/jquery-timers/jquery.timers-1.1.2.js"></script>
      <script type="text/javascript" src="${ctxStatic}/layer/layer.js"></script>
      <script type="text/javascript" src="${ctxStatic}/web/login.js"></script>
      <script type="text/javascript">
        $(function(){
          openLogin(2);
          $("#username").focus();
        })
      </script>-->

    </div>
</template>

<style>
  .login-submit{
  display: block;
    text-align: center;
    text-decoration: none;
  }
</style>

<script>
  import '@/assets/css/pagination.css'
  import '@/assets/css/login.css'
    export default {
        data() {
            return {msg: '初始代模板'}
        },methods:{
        login(){
          this.$router.push("/auth/login")
        }
      }
    }
</script>
