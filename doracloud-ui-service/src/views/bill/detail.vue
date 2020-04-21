<template>
  <div>
    <!--<nav-header></nav-header>-->
  <div class="main clearfix">
    <!--<menu-left></menu-left>-->
    <div class="content">
      <nav-bread>
        <slot>
          <a href="javascript:;">我的账单</a>&nbsp;&gt;&nbsp;<a href="javascript:;">账单详情</a>
        </slot>
      </nav-bread>
      <div class="wrapper">
        <div class="inner">
          <div class="table-box">
            <div class="table-desc">
              <span class="span_09">账单编号：20160801</span>
              <span class="p-line"></span>
              <span class="span_09">月份：20160801</span>
              <div class="mr20 fr">
                账单金额：<span class="span_11">¥1400</span>，总流量：<span class="span_11">100G</span>
              </div>
            </div>
            <table class="table">
              <tr>
                <th>商品类型</th>
                <th>商品规格</th>
                <th>单价/元</th>
                <th>数量</th>
                <th>小计/元</th>
                <th>备注</th>
              </tr>
              <tr>
                <td rowspan="3">国内流量</td>
                <td>10M</td>
                <td>5元</td>
                <td>3</td>
                <td>15元</td>
                <td></td>
              </tr>
              <tr>
                <td>10M</td>
                <td>5元</td>
                <td>3</td>
                <td>15元</td>
                <td></td>
              </tr>
              <tr>
                <td>10M</td>
                <td>5元</td>
                <td>3</td>
                <td>15元</td>
                <td></td>
              </tr>
              <tr>
                <td rowspan="4">省内流量</td>
                <td>10M</td>
                <td>5元</td>
                <td>3</td>
                <td>15元</td>
                <td></td>
              </tr>
              <tr>
                <td>10M</td>
                <td>5元</td>
                <td>3</td>
                <td>15元</td>
                <td></td>
              </tr>
              <tr>
                <td>10M</td>
                <td>5元</td>
                <td>3</td>
                <td>15元</td>
                <td></td>
              </tr>
              <tr>
                <td>10M</td>
                <td>5元</td>
                <td>3</td>
                <td>15元</td>
                <td></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--<nav-footer></nav-footer>-->
  </div>
</template>

<script>
  import "@/assets/css/common.css"
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
