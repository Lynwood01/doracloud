<template>
  <div class="main clearfix">
    <!--<nav-header></nav-header>-->
    <nav-bread>
      <slot><a href="javascript:;">订单支付</a></slot>
    </nav-bread>
    <div class="content2">
      <span class="span_13">支付确认</span>
      <div class="data-step">
        <div class="gg-sel-copy">
          <i class="dot-ico dt"></i>
          <i class="dot-ico db"></i>
          <div class="dot-label dl-t">支付信息确认</div>
          <div class="pay-box clearfix">
            <div class="fl">
              <div class="item">
                <div class="label">订单编号：</div>
                <input type="text" class="input" value="亚信集团（南京）">
              </div>
              <div class="item">
                <div class="label">金额：</div>
                <input type="text" class="input" value="100,000">
              </div>
              </br>
              <div class="item">
                <div class="label">付款日期：</div>
                <input type="text" class="input" value="025-85301234">
              </div>
              <div class="item">
                <div class="label">实付金额：</div>
                <input type="text" class="input" value="98,000">
              </div>
            </div>
            <div class="fr mt20">
              <div class="f12">剩余可支付金额为</div>
              <span class="span_11">¥98,800</span>
            </div>
          </div>
          <div class="dot-label dl-b">支付凭证上传 </div>
        </div>
        <div class="gg-amount clearfix">
          <div class="img-play">
            <img src="/static/images/demo.jpg" alt="凭证">
            <div class="del">删除凭证</div>
          </div>
          <a class="fileupload" href="javascript:;">
            <input type="file">
          </a>
        </div>
        <div class="gg-amount">
          <router-link to="/registSucc" class="normal-btn">确认</router-link>
          <router-link to="/buy/confirm" class="normal-btn cancel-btn">取消</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import "@/assets/css/common.css"
  import "@/assets/css/data.css"
  import "@/assets/css/new.css"
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
  import MenuLeft from '@/components/common/left'
  import NavBread from '@/components/common/buyBread'
  export default {
    data() {
      return {msg: '初始代模板'}
    },
    components:{
      NavHeader,
      NavFooter,
      MenuLeft,
      NavBread
    }
  }
</script>
