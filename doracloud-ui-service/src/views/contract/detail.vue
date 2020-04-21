<template>
  <div class="main clearfix">
    <!--<nav-header></nav-header>-->
   <!--<menu-left/>-->
    <div class="content">
      <nav-bread>
        <slot><a href="javascript:;">我的合同</a>&nbsp;&gt;&nbsp;<a href="javascript:;">合同详情</a></slot>
      </nav-bread>
      <div class="wrapper con-td">
        <div class="table-list">
          <div class="table-desc">
            <span class="g12 mr30">合同编码：{{contractVo.contId}}</span>|
            <span class="g12 mr30">合同号：{{contractVo.contNo}}</span>

            <div class="fr mr30">
              <span class="gray f12">订购时间：{{contractVo.createDateStr}}</span>
            </div>
          </div>
          <table class="table">
            <thead>
            <tr>
              <th>流量类型</th>
              <th>流量额度</th>
              <th>价格/元</th>
              <th>折扣/%</th>
              <th>金额/万元</th>
              <th>余额/元</th>
              <th>合同有效期至</th>
              <th>状态</th>
            </tr>
            </thead>
            <tbody>
              <tr v-for="item in listNation">
                <td class="hebing0">国内流量</td>

                <td>{{item.goodsModel}}</td>
                <td>
                  <!--<fmt:formatNumber type="number" value="${list.unitPrice/1000}" maxFractionDigits="11"/>-->
                </td>
                <td class="hebing">{{item.offRate}}</td>


                <td class="hebing1">
                  <div class="am">合同金额：<span class="og">
							   <!--<fmt:formatNumber type="number" value="${contractVo.contValue/10000000}" maxFractionDigits="11"/>-->
							   </span></div>
                  <div class="am">预付款：<span class="og">

							   <!--<fmt:formatNumber type="number" value="${contractVo.payment/10000000}" maxFractionDigits="11"/>-->

							   </span></div>
                  <div class="am">保证金：<span class="og">

							   <!--<fmt:formatNumber type="number" value="${contractVo.deposit/10000000}" maxFractionDigits="11"/>-->

							   </span></div>
                </td>
                <td class="hebing2">
                  <div class="am">可用余额：<span class="og">
							   <!--<fmt:formatNumber type="number" value="${(contractVo.balance-contractVo.bookCredit)/1000}" maxFractionDigits="11"/>-->
							   </span>
                  </div>
                  <div class="am">保证金金额：<span class="og">

							   <!--<fmt:formatNumber type="number" value="${contractVo.useDeposit/1000}" maxFractionDigits="11"/>--></span></div>
                    <div v-if="contractVo.bookCredit>0" class="am">透支金额：<span class="og">

							   <!--<fmt:formatNumber type="number" value="${contractVo.bookCredit/1000}" maxFractionDigits="11"/>-->
							   </span></div>
                </td>
                <td class="hebing3"><!--<fmt:formatDate value="${contractVo.expDate}" pattern="yyyy-MM-dd"/>-->
                </td>
                <td class="hebing4">{{contractVo.subStateName}}</td>

              </tr>

            <input type="hidden" id="row" v-bind:value="contractVo.contractItems.length" />
              <tr v-for="item in listProvince">
                <td class="hebing5">省内流量</td>
                <td>{{item.goodsModel}}</td>
                <td>
                  <!--<fmt:formatNumber type="number" value="${list.unitPrice/1000}" maxFractionDigits="11"/>-->
                </td>
                <td class="hebing6">{{item.offRate}}</td>
              </tr>
            </tbody>

          </table>
          <div class="record-list">
            <div class="record-header">缴费记录<a href="javascript:;" class="jiantou-up"></a></div>

              <div v-for="item in paymentList" class="record-data">
                <span class="data1 mr30">支付流水号：{{item.paymentId}}</span>
                <span class="data2 mr30">
                   <!--<c:if test="${not empty item.payDate}">
                            <fmt:formatDate value="${item.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </c:if>
                        <c:if test="${empty item.payDate}">
                            <fmt:formatDate value="${item.applyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </c:if>-->
					</span>

                <div class="data-right">
                 <!-- <div class="data3 mr30">支付状态：
                    <c:if test="${item.payState eq 200}">
                      <span class="og">支付待确认</span>
                    </c:if>
                    <c:if test="${item.payState eq 300}">
                      <span class="og">支付成功</span>
                    </c:if>
                    <c:if test="${item.payState eq 500}">


                      <span class="og">支付失败</span>
                    </c:if>
                    <c:if test="${item.payState eq 600}">


                      <span class="og">转出成功</span>
                    </c:if>
                    <c:if test="${item.payState eq 700}">


                      <span  class="og">转入成功</span>
                    </c:if>
                  </div>
                  <div class="data3 mr30">缴费金额：<span class="og">

                       <fmt:formatNumber type="number" value="${item.amount/10000000}" maxFractionDigits="11"/>
                       万</span></div>-->
                  <a class="blue-btn" href="javascript: viewPay('${item.paymentId}')">缴费凭证</a>
                </div>
              </div>

          </div>
          <div class="record-list">
            <div class="record-header">保证金转存记录<a href="javascript:;" class="jiantou-up"></a></div>
              <div v-for="item in contbookRecordList" class="record-data">
                <span class="data1 mr30">支付流水号：{{item.id}}</span>
                <span class="data2 mr30">
                    <!--<fmt:formatDate value="${item.operDate}" pattern="yyyy-MM-dd HH:mm:ss"/>-->
				   </span>
                <div class="data-right">
                  <div class="data3 mr30">转存金额：<span class="og">
                       <!--<fmt:formatNumber type="number" value="${0-item.operAmount/10000000}" maxFractionDigits="11"/>-->
                 	     万</span></div>
                </div>
              </div>

          </div>
        </div>
      </div>
    </div>
    <!--<nav-footer></nav-footer>-->
  </div>
 <!-- <script type="text/javascript" src="${ctxStatic}/web/contract/coalition.js"></script>
  <script type="text/javascript" src="${ctxStatic}/web/contract/view.js"></script>
  <script type="text/javascript">
    $(function(){
      $(".jiantou-up").click(function(){
        var that = $(this);
        if(that.hasClass('down')){
          $(this).parents(".record-list").find('.record-data').show();
          $(this).removeClass('down');
        }else{
          $(this).parents(".record-list").find('.record-data').hide();
          $(this).addClass('down');
        }
      })
    })
  </script>-->
</template>

<script>
  import '@/assets/css/common.css'
  import '@/assets/css/contract.css'
  import '@/assets/css/new.css'
  // import '@/assets/js/jquery-1.9.1.js'
  // import '@/assets/js/coalition.js'
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
  import MenuLeft from '@/components/common/left'
  import NavBread from '@/components/common/bread'
  export default {
    data() {
      return {
        contractVo: {
          contId:"1001",
          contNo:"1002210",
          createDateStr:"2019-03-11",
          contractItems:[
            {id:4561},{id:456}
          ]
        },
        listNation:[
          {
            goodsModel:"500M",
            goodsSpecs:"500M",
            offRate:"79",
          }
        ],
        listProvince:[
          {
            goodsModel:"200M",
            offRate:"80",
          }
        ]}
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
      }
    }
  }
</script>
