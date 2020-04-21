<template>

  <div>
    <!--<nav-header></nav-header>-->
  <div class="main clearfix">
   <!--<menu-left></menu-left>-->
    <div class="content">
      <nav-bread>
      </nav-bread>
      <div class="wrapper">
        <div class="inner">
          <div class="search-bar">
            <div class="sr-01" style="width:200px;">
              <span class="span_08" >手机号</span>
              <input id="f_phone" type="text" value="" style="width:140px;">
            </div>
            <div class="sr-01 sr-02" style="width:210px;">
              <span class="span_08">充值时间</span>
              <input id="f_from" class="wd" onClick="WdatePicker()" type="text" value="" style="width:140px;">
              <i class="ico-wdate"></i>
            </div>至&nbsp;
            <div class="sr-01" style="width: 193px;">
              <span class="span_08"></span>
              <input id="f_to" type="text" value="" style="width:140px;">
              <i class="ico-wdate"></i>
            </div>
            <div class="sr-01" style="width:220px;">
              <span class="span_08">批次号</span>
              <input id="f_batch" type="text" value="" style="width:160px;">
            </div>
            <a href="javascript: newQueryFx();" class="btn">查询</a>
          </div>
          <div class="table-box">
            <table class="table">
              <thead>
              <tr>
                <th>手机号码</th>
                <th>流量类型</th>
                <th>商品规格(M)</th>
                <th>价格(折后)元</th>
                <th>批次号</th>
                <th>创建时间</th>
                <th>充值完成时间</th>
                <th>充值状态</th>
              </tr>
              </thead>
              <tbody>
              </tbody>


            </table>
            <div class="page">
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <!--<script type="text/javascript" src="${ctxStatic}/layer/layer.js"></script>-->
  <!--<script type="text/javascript">-->
    <!--$(function(){-->
      <!--$(".mark-ico").on("mouseover",function(){-->
        <!--layer.tips($(this).attr("data"), this,{tips: [1, '#5b5b61']});-->
      <!--}).on("mouseout",function(){-->
        <!--layer.closeAll();-->
      <!--})-->
    <!--})-->
  <!--</script>-->
  <!--<script src="${ctxStatic}/web/myOrder/fx.js"></script>-->
  <!--<script src="${ctxStatic }/jquery/jquery-formatMoney.js"></script>-->
    <!--<nav-footer></nav-footer>-->
  </div>
</template>

<script>
  import  "./../../assets/css/common.css"
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
  import MenuLeft from '@/components/common/left'
  import NavBread from '@/components/common/disBread'
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
