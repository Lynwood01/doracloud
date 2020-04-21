<template>
  <div class="contaniner">
    <!--<nav-header></nav-header>-->
    <div class="main clearfix">
      <!--<menu-left></menu-left>-->
      <div class="content">
       <nav-bread>
         <slot><a href="javascript:;">个人信息</a></slot>
       </nav-bread>
        <div class="wrapper">
          <div class="wrapper-t clearfix">
            <div class="wrapper_inner_01"><span class="span_03">个人</span><span class="span_04">中心</span></div>
            <div class="wrapper_inner_02">
              <div class="inner-time">
                <span class="span_05">{{cust.custName}},你好！</span><span class="span_06">{{loginTime }}</span>
              </div>
              <div class="inner-level">
                <span class="span_05">账号安全等级：</span>
                <div class="bar"><div style="width:50%;"></div></div>
                <span class="span_07">中</span>
              </div>
            </div>
          </div>
          <div class="info-list">
            <table border="0">
              <tr style="height: 15px">
                <td colspan="2" style="text-align:center;color: red" id="message"></td>
              </tr>
            </table>
            <div class="list-gps">
              <div class="gps-lbl">联系人姓名</div>
              <span id="span_name">{{cust.userName}}</span>
              <div id="div_name" class="input-box" style="display:none;">
                <input type="text" value="葫芦娃_8778">
                <a href="">确认</a>
              </div>
              <!-- <a href="javascript:modifyInfo('name');" class="modify">修改</a> -->
            </div>
            <div class="list-gps">
              <div class="gps-lbl">手机号码</div>
              <span id="span_phone">{{cust.userMobile}}</span>
              <div id="div_phone" class="input-box" style="display:none;">
                <input type="text" value="18900000000">
                <a href="">确认</a>
              </div>
              <!-- <a href="javascript:modifyInfo('phone');" class="modify">修改</a>-->
            </div>
            <!-- 20161012修改开始 -->
            <div class="list-gps">
              <div class="gps-lbl">登录密码</div>
              <span id="span_pw">******</span>
              <div id="div_pw" class="reset-pw" style="display:none;">
                <div class="input-box mb10">
                  <input id="oldpassword" class="w360" type="password" value="" placeholder="请输入旧密码">
                </div><i class=""></i>
                </br>
                <div class="input-box mb10">
                  <input id="newpassword" class="w360" type="password" value="" placeholder="请输入新密码">
                </div><i class=""></i>
                </br>
                <div class="input-box">
                  <input id="newpassword_2" type="password" value="" placeholder="请再次输入新密码">
                  <a href="javascript:modifyInfo_ok(cust.acctId);">确认</a>
                </div><i class=""></i>

              </div>
              <a id="a_pw" href="javascript:modifyInfo('pw');" class="modify">修改</a>
              <a id="a_cl" href="javascript:showOldPw();" class="modify" style="display:none;">取消</a>
            </div>
            <!-- 20161012修改开始 -->
            <div class="list-gps">
              <div class="gps-lbl">邮箱地址</div>
              <span id="span_address">{{cust.userEmail}}</span>
              <div id="div_address" class="input-box" style="display:none;">
                <input type="text" value="18900123456@qq.com">
                <a href="">确认</a>
              </div>
              <!-- <a href="javascript:modifyInfo('address');" class="modify">修改</a>-->
            </div>
            <div class="list-gps">
              <div class="gps-lbl">公司名称</div>
              <span id="span_company">{{cust.custName}}</span>
              <div id="div_company" class="input-box" style="display:none;">
                <input type="text" value="某某集团四川分公司XX部">
                <a href="">确认</a>
              </div>
              <!-- <a href="javascript:modifyInfo('company');" class="modify">修改</a>-->
            </div>
          </div>
        </div>

      </div>
    </div>
    <!--<nav-footer></nav-footer>-->
  </div>
<!--  <script type="text/javascript">
    function modifyInfo(acctid){
      $("#span_"+acctid).hide();
      $("#div_"+acctid).show();
      $("#a_"+acctid).hide();
      /* $('#div_pw').show(); */
      $('#newpassword').val('');
      if(acctid == "pw"){
        $("#a_cl").show();
      }
    }

    function showOldPw(){
      $("#a_cl").hide();
      $("#span_pw").show();
      $("#div_pw").hide();
      $("#a_pw").show();
    }

    function modifyInfo_cancel(acctid){
      $('#div_pw').hide();
      $('#newpassword').val('');
    }
    function modifyInfo_ok(acctid){
      var newpassword = $('#newpassword').val();
      var oldpassword = $('#oldpassword').val();
      //	alert(oldpassword);
      //	alert(newpassword);
      if (checkPassWord()) {
        $("#message").html("");

        $.ajax({
          url : ctx + "/login/findPassWord.ajax",
          type : "POST",
          dataType:"json",
          data : {
            oldpassword : oldpassword,
            newpassword : newpassword,
            acctid : acctid
          },
          success : function(data){
            if(data.code == 1)
            {
              layer.alert("修改密码成功!将在下次登录生效！");
            } else {
              layer.alert(data.msg);
            }
          },
          error: function(data) {
            layer.alert("异常");
          }
        });
      }
    }

    function checkPassWord(){
      var oldpassword = $('#oldpassword').val();
      if(oldpassword == "" || oldpassword == null){
        $("#message").html("原密码不能为空！");
        return false;
      }


      var newpassword = $('#newpassword').val();
      if(newpassword == "" || newpassword == null){
        $("#message").html("密码不能为空！");
        return false;
      }

      var newpassword_2 = $('#newpassword_2').val();
      if(newpassword_2 == "" || newpassword_2 == null || newpassword_2 != newpassword){
        $("#message").html("两次密码不相同！");
        return false;
      }

      var pwd_regex = /^(?![0-9a-z]+$)(?![0-9A-Z]+$)(?![0-9\x21-\x2f\x3a-\x40\x5b-\x60\x7b-\x7e]+$)(?![a-z\x21-\x2f\x3a-\x40\x5b-\x60\x7b-\x7e]+$)(?![a-zA-Z]+$)(?![A-Z\x21-\x2f\x3a-\x40\x5b-\x60\x7b-\x7e]+$)[a-zA-Z0-9\x21-\x2f\x3a-\x40\x5b-\x60\x7b-\x7e]{8,16}$/;

      if (!pwd_regex.test(newpassword)) {
        $("#message").html("密码必须由8-16位数字+字母+特殊字符组合");
        return false;
      }
      return true;
    }
  </script>-->
</template>

<script>
  import '@/assets/css/common.css'
  import '@/assets/css/new.css'
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
  import MenuLeft from '@/components/common/left'
  import NavBread from '@/components/common/bread'
  export default {
    data() {
      return {msg: '商品列表',
      cust:{
        custName:"張三",
        acctId:"100220022",
        userName:"張三",
        userMobile:"15895840832",
        userEmail:"15895840832@163.com",
      },loginTime:"2019-03-10"}
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
      },
      modifyInfo(acctid){
        $("#span_"+acctid).hide();
        $("#div_"+acctid).show();
        $("#a_"+acctid).hide();
        /* $('#div_pw').show(); */
        $('#newpassword').val('');
        if(acctid == "pw"){
          $("#a_cl").show();
        }
      }

    }
  }
</script>
