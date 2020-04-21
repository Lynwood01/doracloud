<template>
  <div>
    <!--<nav-header></nav-header>-->
  <div class="main clearfix">
    <!--<menu-left></menu-left>-->
    <div class="content">
      <nav-bread>
        <slot>
          <a href="javascript:;">我的账单</a>
        </slot>
      </nav-bread>
      <div class="wrapper">
        <ul class="tabs">
          <li class="active" id="nowli">待确认</li>
          <li id="historyli">历史账单</li>
        </ul>
        <div class="inner">
          <div class="table-box">
            <table class="table" id="nowbill">
              <!--<tr>
                                <th>月份</th>
                                <th>使用流量</th>
                                <th>计费金额/元</th>
                                <th>已付金额/元</th>
                                <th>欠费金额/元</th>
                                <th>操作</th>
                            </tr>
                             -->
            </table>
            <div class="page" id="nowpage"></div>
          </div>
        </div>
        <div class="inner" style="display:none;">
          <div class="table-box">
            <table class="table" id="historybill">
              <!-- <tr>
                                <th>月份</th>
                                <th>使用流量</th>
                                <th>计费金额/元</th>
                                <th>已付金额/元</th>
                                <th>欠费金额/元</th>
                            </tr>
                           -->
            </table>
            <div class="page" id="historypage"></div>
          </div>
        </div>

      </div>
    </div>
  </div>
  <!--<nav-footer></nav-footer>-->
  </div>
  <!--<script src="${ctxStatic}/web/bill/mybill.js"></script>-->

</template>
<script>
  import "@/assets/css/common.css"
  import"@/assets/css/new.css"
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
