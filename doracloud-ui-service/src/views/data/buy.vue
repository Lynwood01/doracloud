<template>
  <div class="main clearfix">
    <!--<nav-header></nav-header>-->
    <div class="content2">
      <nav-bread>
      </nav-bread>
      <div class="wrapper data-wrapper">
        <div class="wrapper-t clearfix">
          <img class="img_01" src="/static/images/data_buy.jpg" alt="个人中心">
          <div class="wrapper_inner_01"><span class="span_03">流量</span><span class="span_04">购买</span></div>
        </div>
        <div class="wrapper_inner_02">
          <span class="span_05">企业向电信购买1000个100M的流量包，给员工使用。企业每月按实际充值到员工手机的流量额度进行支付，电信给予9折优惠。企业向电信购买1000个100M的流量包，给员工使用。企业每月按实际充值到员工手机的流量额度进行支付，电信给予9折优惠。</span>
        </div>
      </div>
      <div class="data-step">
        <div class="gg-sel">
          <div class="gg-title">使用规格选择</div>
          <div class="gg-list">
            <ul class="clearfix">
              <li class="gg-label">省内通用</li>
              <li class="gg-data active">
                <i class="data-ico"></i>
                <div class="data-top">10M</div>
                <div class="data-bottom">单价：<span class="span_data">2元</span></div>
              </li>
            </ul>
            <ul class="clearfix">
              <li class="gg-label">国内通用</li>
              <li class="gg-data active">
                <i class="data-ico"></i>
                <div class="data-top">10M</div>
                <div class="data-bottom">单价：<span class="span_data">2元</span></div>
              </li>
            </ul>
          </div>
          <div class="gg-title">请填写购买金额</div>
        </div>
        <div class="gg-amount">
          <input class="input" type="text" placeholder="请输入您需要购买的金额">
          <span class="span_amount">单位：元</span>
        </div>
        <div class="gg-amount">
          <router-link to="/buy/confirm" class="normal-btn">下一步</router-link>
        </div>
        <div class="cankao">
          <div class="gg-title">购买优惠参考：</div>
          <table class="table mt10">
            <tr>
              <td class="td-out">
                <div class="out">
                  <div class="out-l">购买金额</div>
                  <div class="out-r">折扣</div>
                </div>
              </td>
              <td>0-10万</td>
              <td>10-20万</td>
              <td>20-50万</td>
              <td>50-100万</td>
            </tr>
            <tr>
              <td>省内流量</td>
              <td>-</td>
              <td>9</td>
              <td>85</td>
              <td>8</td>
            </tr>
            <tr>
              <td>省内流量</td>
              <td>-</td>
              <td>9</td>
              <td>85</td>
              <td>8</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <!--<nav-footer></nav-footer>-->
  </div>
</template>

<script>
  import "@/assets/css/common.css"
  import"@/assets/css/data.css"
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
