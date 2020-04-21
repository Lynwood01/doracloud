<template>

  <div class="main clearfix">
    <!--<nav-header></nav-header>-->
    <nav-bread>
      <slot><a href="javascript:;">订单提交</a></slot>
    </nav-bread>
    <div class="content2">
      <span class="span_13">确认购买</span>
      <div class="data-step">
        <div class="gg-sel2">
          <div class="gg-title">购买的商品列表</div>
          <div class="gg-list mm30">
            <table class="table mt10">
              <tr>
                <td></td>
                <td class="td-out">
                  <div class="out">
                    <div class="out-l">流量类型</div>
                    <div class="out-r">规格</div>
                  </div>
                </td>
                <td>10M</td>
                <td>20M</td>
                <td>50M</td>
                <td>100M</td>
                <td>200M</td>
                <td>500M</td>
                <td>1G</td>
              </tr>
              <tr>
                <td rowspan="2">单价/元</td>
                <td>省内流量</td>
                <td>5元</td>
                <td>-</td>
                <td>10元</td>
                <td>20元</td>
                <td>50元</td>
                <td>70元</td>
                <td>85元</td>
              </tr>
              <tr>
                <td>国内流量</td>
                <td>5元</td>
                <td>15元</td>
                <td>30元</td>
                <td>50元</td>
                <td>100元</td>
                <td>160元</td>
                <td>200元</td>
              </tr>
              <tr>
                <td rowspan="2">单价/元</td>
                <td>省内流量</td>
                <td>90%</td>
                <td>85%</td>
                <td>85%</td>
                <td>85%</td>
                <td>80%</td>
                <td>80%</td>
                <td>80%</td>
              </tr>
              <tr>
                <td>省内流量</td>
                <td>90%</td>
                <td>85%</td>
                <td>85%</td>
                <td>85%</td>
                <td>80%</td>
                <td>80%</td>
                <td>80%</td>
              </tr>
            </table>
          </div>
          <div class="gg-title">请填写购买金额</div>
        </div>
        <div class="gg-amount">
          您当前购买金额为:<span class="span_11">¥100,000.00</span>，当前享受的折扣为国内通用<span class="span_08">85</span>折，省内通用<span class="span_08">9</span>折。
        </div>
        <div class="gg-amount">
          <router-link to="/buy/pay" class="normal-btn">提交订单</router-link>
          <router-link to="/buy" class="normal-btn cancel-btn">取消订单</router-link>
        </div>
      </div>
    </div>
    <!--<nav-footer></nav-footer>-->
  </div>
</template>

<script>
  import "@/assets/css/common.css"
  import"@/assets/css/data.css"
  import"@/assets/css/new.css"
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
