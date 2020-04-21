<template>
<!--    <%@ include file="/WEB-INF/include/head.jsp"%>
    <link rel="stylesheet" href="${ctxStatic}/css/common.css">
    <link rel="stylesheet" href="${ctxStatic}/css/rg.css">
    <link rel="stylesheet" href="${ctxStatic}/css/new.css">
    <link rel="stylesheet" href="${ctxStatic}/selectordie/selectordie.css">
    <link rel="stylesheet" href="${ctxStatic}/selectordie/selectordie_theme_01.css">
    <script src="${ctxStatic}/selectordie/selectordie.min.js"></script>
    <script src="${ctxStatic}/selectordie/selectordie.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/selectordie/selectordie.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/layer/laypage.js"></script>-->

  <!--  <script type="text/javascript">
      $(function(){
        $("img").click(function(){
          window.location.href=ctx+'/index.html'
        });
      });

    </script>-->
  <!--<nav-header></nav-header>-->
  <div class="main clearfix">
    <div class="rg-main">
      <div class="rg-title">请填写注册申请</div>
      <div class="rg-form">
        <form action="" id="registForm">
          <div class="form-row">
            <label><span>*</span>企业名称：</label>
            <input name ="conpanyName" id="s_conpanyName" class="input large" type="text" placeholder="请输入企业名称">
          </div>
          <div class="form-row">
            <label><span>*</span>所在地区：</label>
            <div style='width:250px;height:40px;' class='select'>
              <select class='sod_select' id="s_regionId" name ="regionId" >
                <option value="">请选择地区</option>
                <!--<c:forEach items="${regionList}" var="item">-->
                  <option value='010'>北京市</option>
                <!--</c:forEach>-->
              </select>
            </div>
            <!--<script type="text/javascript">
              $('select').selectOrDie();
            </script>-->
            <label><span>*</span>购买金额：</label>
            <input class="input" style="width: 237.22222px;" type="text" id="s_amount" name ="amount" >元
          </div>
          <div class="form-row">
            <label><span>*</span>购买用途：</label>
            <textarea class="textarea" id="s_purIntention" name ="purIntention" placeholder="请描述需要的流量包大小及数量，以及购买目的"></textarea>
            <a class="data-info" href="javascript:showData();">流量包规格信息</a>
          </div>
          <div class="form-row">
            <label><span>*</span>联系人：</label>
            <input class="input" type="text" id="s_userName" name ="userName" >
            <label>QQ：</label>
            <input class="input" type="text" id="s_userQQ" name ="userQQ" >
          </div>
          <div class="form-row">
            <label><span>*</span>手机号：</label>
            <input class="input" type="text" id="s_userMobile" name ="userMobile" >
          </div>
          <div class="form-row">
            <label><span>*</span>图片验证码：</label>
            <input id="validateCode" name="validateCode" class="input" type="text" placeholder="请输入验证码" >
            <img id="validateImg" class="refresh-img" onclick="changeValidateCode(this)"/>
            <div class="refresh">
              <span>看不清</span>
              <a class="refresh-code" href="javascript:changeValidateCode(document.getElementById('validateImg'))">换一张</a>
            </div>
            <button id="smsButton_register" class="normal-btn disabled" type="button" onclick="getSmsCode_register()">点击获取验证码</button>
          </div>
          <div class="form-row">
            <label><span>*</span>短信验证码：</label>
            <input class="input" type="text" id="smsValidCode" name ="smsValidCode" >
            <span class="rg-tip">请查收手机短信，并填写短信的验证码</span>
          </div>
          <button class="normal-btn yx-btn disabled" type="button"  @click="applySubmit()">提交</button>
        </form>
      </div>
    </div>
  </div>
  <!--<nav-footer></nav-footer>-->
  <!--<div id="data" class="data-info-box">
    <div class="bg"></div>
    <div class="data-list">
      <div class="list-cont">
        <a class="data-close" href="javascript:hiddenData();" style=" margin-right: 0px;"></a>
        <table class="table">
          <thead>
          <tr><td></td><td colspan="2">单价/元</td></tr>
          <tr><td>商品规格</td><td>国内流量</td><td>省内流量</td></tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
      <div class="page" style="padding-right: 30px;background:white;" id="footpage"></div>
    </div>
  </div>-->
 <!-- <script src="${ctxStatic}/web/user/apply.js" type="text/javascript"></script>-->

</template>
<script>
  import  "./../../assets/css/common.css"
  import "../../assets/css/regist.css"
  import  "./../../assets/css/new.css"
  import  "./../../assets/css/selectordie/selectordie.css"
  import  "./../../assets/css/selectordie/selectordie_theme_01.css"
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
    export default {
        data() {
            return {msg: '初始代模板'}
        },
      components:{
        NavHeader,
        NavFooter
      },
      methods:{
        applySubmit(){
          this.$router.push("/registSucc")
        }
      }
    }
</script>
