<template>

  <div>
  <nav-header></nav-header>
  <div class="main clearfix">
    <menu-left></menu-left>
    <div class="content">
      <nav-bread>
        <slot><a href="javascript:;">订单详情</a></slot>
      </nav-bread>
      <div class="wrapper">
        <span class="span_10">订单信息</span>
        <div>
          <div class="order-step">
            <div class="order-step-inner" style="width:50%;"></div>
          </div>
          <ul class="steps">
            <li>
              <div>1.<span class="fs12">新建</span></div>
              <div class="fs12 gray">2016-07-26 12:00:00</div>
            </li>
            <li>
              <div>2.<span class="fs12">待支付</span></div>
              <div class="fs12 gray">2016-07-26 12:00:00</div>
            </li>
            <li>
              <div>3.<span class="fs12">已支付</span></div>
            </li>
            <li>
              <div>4.<span class="fs12">开通完成</span></div>
            </li>
          </ul>
        </div>
        <div class="table-box">
          <div class="table-desc">
            <span class="span_09">订单编码：201608180001</span>
            <span class="p-line"></span>
            <span class="span_09">订购时间：2016年8月8日  15:56:30</span>
            <a class="order-desc fr" href="">订单详情</a>
          </div>
          <table class="table">
            <tr>
              <th>商品类型</th>
              <th>流量额度</th>
              <th>价格/元</th>
              <th>折扣/%</th>
              <th>订单金额/元</th>
            </tr>
            <tr>
              <td rowspan="3">国内流量</td>
              <td>10M</td>
              <td>5元</td>
              <td>90</td>
              <td rowspan="7" valign="top">
                <div class="mt30">
                  <div><div class="am-del">280元<span></span></div></div>
                  <div>实付金额：<span class="span_08">238</span>元</div>
                </div>
              </td>
            </tr>
            <tr>
              <td>10M</td>
              <td>5元</td>
              <td>90</td>
            </tr>
            <tr>
              <td>10M</td>
              <td>5元</td>
              <td>90</td>
            </tr>
            <tr>
              <td rowspan="4">省内流量</td>
              <td>10M</td>
              <td>5元</td>
              <td>90</td>
            </tr>
            <tr>
              <td>10M</td>
              <td>5元</td>
              <td>90</td>
            </tr>
            <tr>
              <td>10M</td>
              <td>5元</td>
              <td>90</td>
            </tr>
            <tr>
              <td>10M</td>
              <td>5元</td>
              <td>90</td>
            </tr>
          </table>
        </div>
        <div class="btn-group">
          <a class="green btn" href="">关&nbsp;闭</a>
        </div>
      </div>

    </div>
  </div>
    <nav-footer></nav-footer>
  </div>

</template>

<style>
</style>

<script>
  import "./../../assets/css/common.css"
  import "./../../assets/css/order.css"
  import NavHeader from "./../../components/header/head"
  import NavFooter from "./../../components/footer/footer"
  import NavBread from "./../../components/common/bread"
  import MenuLeft from "./../../components/common/left"
    export default {
        data() {
            return {msg: '订单详情页面'}
        },components:{
        NavHeader,
        NavBread,
        NavFooter,
        MenuLeft
      }
    }
</script>
