<template>
  <div class="head">
    <div class="log">
      <img src="/static/images/logo.png" alt="流量后向经营系统"/>

    </div>
    <ul class="menu">
      <li><router-link to="/index"><i class="menu-ico c1"></i>首页</router-link></li>
      <li><router-link to="/trafficDis"><i class="menu-ico c2"></i>流量分销</router-link></li>
      <li><router-link to="/buy"><i class="menu-ico c3"></i>流量购买</router-link></li>
      <li><router-link to="/info"><i class="menu-ico c4"></i>个人中心</router-link></li>
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
        <router-link class="small-rg" to="/regist">去注册</router-link>
        <a id="login-btn" class="small-login" @click="isShow = true">登录</a>
      </div>
    </div>

    <!--</v-if>-->
    <el-dialog title="用户登录" :visible.sync="isShow" width="40%"  >
      <el-form :model="loginForm">
        <el-form-item>
          <el-col :span="18">
            <el-input v-model="loginForm.username"  size="large" prefix-icon="el-icon-phone" clearable autocomplete="off" placeholder="请输入用户名/手机号码"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item>
          <el-col :span="18">
            <el-input v-model="loginForm.password"  size="large"  prefix-icon="el-icon-edit"  clearable autocomplete="off" show-password placeholder="请输入密码"> </el-input>
          </el-col>
          <el-col :span="6">
            <a href="" class="findPw" tabindex="6">忘记密码</a>
          </el-col>
        </el-form-item>
        <el-form-item>
          <el-col :span="18">
            <el-input v-model="loginForm.validateCode"  prefix-icon="el-icon-success" size="large" clearable autocomplete="off"  placeholder="请输入验证码"></el-input>
          </el-col>
          <el-col :span="6">
            <img src="/static/images/code.jpg" alt="点击换一张" v-model="validateImg" onclick="changeValidateCode(this);" tabindex="5">
          </el-col>
        </el-form-item>

        <el-form-item class="ul-content">
          <a @click="doLogin" class="login-btn">登录</a>
        </el-form-item>
      </el-form>
     <!-- <div class="ul-content">
        <el-form :model="loginForm">
          <span class="errors" v-model="loginForm.errors"></span>
          <el-form-item>
            <input class="required" type="text" name="username" v-model="loginForm.username" placeholder="请输入用户名/手机号码" tabindex="1"/>
          </el-form-item>
          <el-form-item class="input-item">
            <input class="required" type="password" name="password" v-model="loginForm.password"placeholder="请输入密码"  tabindex="2"/>
            <a href="" class="findPw" tabindex="6">忘记密码</a>
          </el-form-item>
          <el-form-item class="input-item">
            <input class="required" type="text" name="validateCode" v-model="loginForm.validateCode" placeholder="请输入验证码" tabindex="3"/>
            <img src="/static/images/code.jpg" alt="点击换一张" v-model="validateImg" onclick="changeValidateCode(this);" tabindex="5">
          </el-form-item>
          <a @click="doLogin" class="login-btn">登录</a>
        </el-form>
      </div>-->
    </el-dialog>
  </div>
</template>
<script>
  import axios from 'axios'
    export default {
        data() {
            return {
              isShow:false,
              username:'',
              password:'',
              validateCode:'',
              validateImg:'',
              loginForm: {
                errors: '',
                username: '',
                password: '',
                validateCode: ''
              },
            }
        },
      methods:{
          toLogin(){
            this.isShow = !this.isShow
          },
        closeLogin(){
          this.isShow = !this.isShow
        },
        doLogin(){
          axios({
              url:"/auth/login",
              method:"post",
              data:{
                username:this.username,
                password:this.password,
                validateCode:this.validateCode
              },
              headers:{
                accee_token:""
              }
            }).then((res)=>{
              let status=res.data.result;
            }).catch((error)=>{
              console.log(error)
            });
        }
      }
    }
</script>
