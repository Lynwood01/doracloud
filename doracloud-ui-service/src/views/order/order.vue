<template>
<div>
  <div>
  <!--<nav-header></nav-header>-->
  <div class="main clearfix">
    <!--<menu-left></menu-left>-->
    <div class="content">
      <nav-bread>
        <slot><a href="javascript:;">我的订单</a></slot>
      </nav-bread>
      <div class="wrapper">
        <ul class="tabs">
          <li class="active">全部</li>
          <li>待支付</li>
        </ul>
        <div class="inner" style="display:none;">
          <div class="search-bar">
            <div class="sr-01">
              <span class="span_08">订单号</span>
              <input type="text" value="201608010001">
            </div>
            <div class="sr-01">
              <span class="span_08">创建时间</span>
              <input type="text" value="20160801" style="width:140px;">
              <i class="ico-wdate"></i>
            </div>
            <div class="sr-01" style="width:190px;">
              <span class="span_08">订单号</span>
              <select id="orderState" name="orderState" class="form-control" style="width:130px;">
                <!-- <option value="1">待支付</option>
                                <option value="2">2</option>
                                <option value="3">3</option> -->
                <!--<c:forEach items="${orderStatusList }" var="list">-->
                  <!--<option value='${list.attrCode }'>${list.attrName }</option>-->
                <!--</c:forEach>-->
              </select>
            </div>
            <a href="" class="btn">查询</a>
          </div>
          <div class="table-box">
            <div class="table-desc">
              <span class="span_09">订单编码22：201608180001</span>
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
                <th>状态</th>
                <th>操作</th>
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
                <td rowspan="7" valign="top"><div class="mt30">待支付</div></td>
                <td rowspan="7" valign="top">
                  <div class="mt30">
                    <div class="tb-b"><a class="pay-btn btn" href="">去支付</a></div>
                    <div class="tb-b"><a class="cancel-order-btn btn" href="">取消订单</a></div>
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
                <th>状态</th>
                <th>操作</th>
              </tr>
              <tr>
                <td rowspan="3">国内流量</td>
                <td>10M</td>
                <td>5元</td>
                <td>90</td>
                <td rowspan="5" valign="top">
                  <div class="mt30">
                    <div><div class="am-del">280元<span></span></div></div>
                    <div>实付金额：<span class="span_08">238</span>元</div>
                  </div>
                </td>
                <td rowspan="5" valign="top"><div class="mt30">待支付</div></td>
                <td rowspan="5" valign="top">
                  <div class="mt30">
                    <div class="tb-b"><a class="pay-btn btn" href="">去支付</a></div>
                    <div class="tb-b"><a class="cancel-order-btn btn" href="">取消订单</a></div>
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
                <td rowspan="2">省内流量</td>
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
        </div>
      </div>
    </div>
  </div>
  <!--<nav-footer></nav-footer>-->
</div>
</div>
 <!-- <script type="text/javascript">
    $(function(){
      $(".tabs li").click(function(){
        $(this).addClass('active').siblings().removeClass('active');
        $(".inner").eq($(this).index()).show().siblings(".inner").hide();
      })
    })
  </script>
  <script type="text/javascript">
    var orderStatusList = {};
  </script>
  <c:forEach items="${orderStatusList }" var="list">
    <script type="text/javascript">
      orderStatusList["${list.attrCode }"] = "${list.attrName }";
    </script>
  </c:forEach>

  <script src="${ctxStatic}/web/myOrder/order.js"></script>-->

</template>
<script>
  import  "@/assets/css/common.css"
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
  import MenuLeft from '@/components/common/left'
  import NavBread from '@/components/common/bread'
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
