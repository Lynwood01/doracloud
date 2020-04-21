<template>

  <div class="main clearfix">
    <nav-bread>
      <slot>
        <a href="javascript:;">流量派发</a>
      </slot>
    </nav-bread>
    <div class="content2">
      <div class="wrapper data-wrapper mb10">
        <div class="wrapper-t clearfix">
          <img class="img_01" src="/static/images/data_buy.jpg"
               alt="个人中心">
          <div class="wrapper_inner_01">
            <span class="span_03">流量</span><span class="span_04">派发</span>
          </div>
        </div>
        <div class="wrapper_inner_02">
          <span class="span_05">企业向电信购买1000个100M的流量包，给员工使用。企业每月按实际充值到员工手机的流量额度进行支付，电信给予9折优惠。企业向电信购买1000个100M的流量包，给员工使用。企业每月按实际充值到员工手机的流量额度进行支付，电信给予9折优惠。</span>
        </div>
      </div>
      <ul class="tabs">
        <li class="active">号码充值</li>
        <li>批量导入充值</li>
      </ul>
      <div class="inner m20">
        <div class="gg-item">
          <i class="dot-ico dt"></i>
          <div class="dot-label dl-t">请选择商品类型</div>
          <p class="dot-line"></p>
          <div class="tab-sel">
              <a v-for="goodsType in goodsTypeList"
                class="sel-item"  id='goodsType_+${goodsType.attrCode}'>{{goodsType.attrName}}</a>
            <div class="sel-right">
              目前可用余额：<span class="green">{{1000000000/1000}}元</span>
            </div>
          </div>
        </div>
        <div class="gg-item">
          <i class="dot-ico dt"></i>
          <div class="dot-label dl-t">请选择商品规格</div>
          <p class="dot-line"></p>
            <div v-for="prod in prodList"class="tab-sel"> <!--<v-if test="${prodMap.key ne goodsTypeList[0].attrCode }" >style="display: none;"</v-if>
            id="prodList_${prodMap.key }"-->
              <a class="sel-item">{{prod.goodsSpecs}}M</a>
              <input  type="hidden" v-bind:id="'goodsPrice_prod_'+prod.goodsId"
                     v-bind:value="prod.goodsPrice">
        </div>
      </div>
      <div class="gg-item">
        <i class="dot-ico un dt"></i>
        <div class="dot-label dl-t">
          请填写需要充值的手机号码,多个号码以英文分号和回车换行分隔
        </div>
        <textarea id='ta_tel' class="textarea dot-textarea"></textarea>
      </div>


      <div class="gg-amount">
        <a href="javascript:void(0)" onclick="submitAdd()"
           class="normal-btn">确认添加</a> <a href="javascript:void(0)"
                                          onclick="clear()" class="normal-btn cancel-btn">取消</a>
      </div>
      <div class="distribut-box">
        <div class="distribut-title clearfix">
          <strong>派发列表</strong>
          <div class="fr">
            消费总计：充值个数<span class="span_11" id="single_num">0</span>，充值总流量<span
            class="span_11" id="single_specs">0M</span>，充值总金额<span
            class="span_11" id="single_prices">¥0</span>。
          </div>
        </div>
        <table class="table " id="singleCacheList">
          <tr>
            <th>手机号码</th>
            <th>商品类型</th>
            <th>商品规格</th>
            <th>价格</th>
            <th>编辑</th>
          </tr>
          <tr>
                          <td>18951467890</td>
                          <td>省内通用流量</td>
                          <td>500M</td>
                          <td>30元</td>
                          <td><a href="" class="del-btn"></a></td>
                      </tr>
                      <tr>
                          <td>18951467890</td>
                          <td>省内通用流量</td>
                          <td>500M</td>
                          <td>30元</td>
                          <td><a href="" class="del-btn"></a></td>
                      </tr>
                      <tr>
                          <td>18951467890</td>
                          <td>省内通用流量</td>
                          <td>500M</td>
                          <td>30元</td>
                          <td><a href="" class="del-btn"></a></td>
                      </tr>
                      <tr>
                          <td>18951467890</td>
                          <td>省内通用流量</td>
                          <td>500M</td>
                          <td>30元</td>
                          <td><a href="" class="del-btn"></a></td>
                      </tr>
        </table>
      </div>
      <div class="gg-amount">
        <a href="javascript:;" @click="batchCheck()"
           class="normal-btn">确认充值</a>
      </div>
    </div>
    <div class="inner m20" style="display:none;">
      <div class="gg-item">
        <i class="dot-ico un dt"></i>
        <div class="dot-label dl-t">请导入需要充值表格</div>
        <div class="import-excel">
          <input type="file" id="uFile" name="uFile" style="display:none" />
          <input type="text" id="uFileName" value="" /> <a
          href="javascript:void(0)" onclick="javascript:openBrowse();">导入</a>
        </div>
        <a href="${ctx }/data/downTempl.html" target="_blank"
           class="download-excel">表格样例下载</a>
      </div>
      <div class="check-content" style="display:block;">
        <div class="check-info">
          <p>
            <i class="info-ico"></i>检测到<span class="span_11" id="span_total">0</span>条手机充值信息，其中有<span
            class="span_11" id="span_right">0</span>条有效信息，充值总额<span
            class="span_11" id="span_price">0元</span> （目前可用余额<span
            class="span_22" id="span_balance">0元</span>）
          </p>
        </div>
        <div class="distribut-box">
          <div class="distribut-title">
            <strong>部分有误信息展示</strong>
          </div>
          <table class="table t2" id="table_t2">
            <tr>
              <th>手机号码</th>
              <th>商品类型</th>
              <th>错误原因</th>
            </tr>
             <tr>
                              <td>18951467890</td>
                              <td>省内通用流量</td>
                              <td>500M</td>
                              <td>手机号码少一位</td>
                          </tr>
                          <tr>
                              <td>18951467890</td>
                              <td>省内通用流量</td>
                              <td>500M</td>
                              <td>手机号码少一位</td>
                          </tr>
                          <tr>
                              <td>18951467890</td>
                              <td>省内通用流量</td>
                              <td>500M</td>
                              <td>手机号码少一位</td>
                          </tr>
                          <tr>
                              <td>18951467890</td>
                              <td>省内通用流量</td>
                              <td>500M</td>
                              <td>手机号码少一位</td>
                          </tr>
          </table>
        </div>
        <div class="gg-amount">
          <a href="javascript:;" @click="batchCheck();"
             class="normal-btn" id="batch_confirm">确认充值</a>
          <p>
            (若导入的表单信息<span class="span_08">有误</span>，请仔细核对后再确认充值)
          </p>
        </div>
      </div>
    </div>
  </div>
  </div>
    <!--<nav-footer></nav-footer>-->
    <!--<script type="text/javascript">
      $(function() {
        $(".tabs li").click(
          function() {
            $(this).addClass('active').siblings().removeClass(
              'active');
            $(".inner").eq($(this).index()).show().siblings(
              ".inner").hide();
          })
      });
    </script>
    <script type="text/javascript"
            src="${ctxStatic }/jquery-upload/ajaxfileupload.js"></script>
    <script type="text/javascript"
            src="${ctxStatic }/web/dataPut/dataPut.js"></script>-->

</template>

<script>
  import "@/assets/css/common.css"
  import"@/assets/css/data.css"
  import"@/assets/css/new.css"
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
  import MenuLeft from '@/components/common/left'
  import NavBread from '@/components/common/disBread'
    export default {
        data() {
            return {
              goodsTypeList: [
                {
                  "attrCode":"10001",
                  "attrName":"全国通用流量"
              },{
                  "attrCode":"10002",
                  "attrName":"全国专用流量"
                },{
                  "attrCode":"20001",
                  "attrName":"省内同用流量"}
                  ,{
                  "attrCode":"20002",
                  "attrName":"省内专用流量"
                }
              ],
              prodList:[
                {
                  "goodsId":"1001",
                  "dataType":"10001",
                  "goodsModel":"10001",
                  "goodsName":"国内10M流量",
                  "goodsPrice":"5",
                  "goodsType":"",
                  "goodsSpecs":"10M",
                  "state":"1"
                },{
                  "goodsId":"1002",
                  "dataType":"10001",
                  "goodsModel":"10001",
                  "goodsName":"国内30M流量",
                  "goodsPrice":"10",
                  "goodsType":"",
                  "goodsSpecs":"30M",
                  "state":"1"
                },{
                  "goodsId":"1003",
                  "dataType":"10001",
                  "goodsModel":"10001",
                  "goodsName":"国内50M流量",
                  "goodsPrice":"15",
                  "goodsType":"",
                  "goodsSpecs":"50M",
                  "state":"1"
                },{
                  "goodsId":"1004",
                  "dataType":"10001",
                  "goodsModel":"10001",
                  "goodsName":"国内100M流量",
                  "goodsPrice":"20",
                  "goodsType":"",
                  "goodsSpecs":"100M",
                  "state":"1"
                },{
                  "goodsId":"1005",
                  "dataType":"10002",
                  "goodsModel":"10002",
                  "goodsName":"国内500M流量",
                  "goodsPrice":"30",
                  "goodsType":"",
                  "goodsSpecs":"500M",
                  "state":"1"
                },{
                  "goodsId":"1006",
                  "dataType":"10002",
                  "goodsModel":"10002",
                  "goodsName":"国内1G流量",
                  "goodsPrice":"50",
                  "goodsType":"",
                  "goodsSpecs":"1G",
                  "state":"1"
                },{
                  "goodsId":"1007",
                  "dataType":"10002",
                  "goodsModel":"10002",
                  "goodsName":"国内2G流量",
                  "goodsPrice":"70",
                  "goodsType":"",
                  "goodsSpecs":"2G",
                  "state":"1"
                },{
                  "goodsId":"2001",
                  "dataType":"20002",
                  "goodsModel":"20002",
                  "goodsName":"省内10M流量",
                  "goodsPrice":"4",
                  "goodsType":"",
                  "goodsSpecs":"10M",
                  "state":"1"
                },{
                  "goodsId":"2002",
                  "dataType":"20002",
                  "goodsModel":"20002",
                  "goodsName":"省内30M流量",
                  "goodsPrice":"8",
                  "goodsType":"",
                  "goodsSpecs":"30M",
                  "state":"1"
                },{
                  "goodsId":"2003",
                  "dataType":"20002",
                  "goodsModel":"20002",
                  "goodsName":"省内50M流量",
                  "goodsPrice":"12",
                  "goodsType":"",
                  "goodsSpecs":"50M",
                  "state":"1"
                },{
                  "goodsId":"2004",
                  "dataType":"20002",
                  "goodsModel":"20002",
                  "goodsName":"省内100M流量",
                  "goodsPrice":"16",
                  "goodsType":"",
                  "goodsSpecs":"100M",
                  "state":"1"
                },{
                  "goodsId":"2005",
                  "dataType":"20002",
                  "goodsModel":"20002",
                  "goodsName":"省内500M流量",
                  "goodsPrice":"24",
                  "goodsType":"",
                  "goodsSpecs":"500M",
                  "state":"1"
                },{
                  "goodsId":"2006",
                  "dataType":"20001",
                  "goodsModel":"20001",
                  "goodsName":"省内1G流量",
                  "goodsPrice":"40",
                  "goodsType":"",
                  "goodsSpecs":"1G",
                  "state":"1"
                },{
                  "goodsId":"2007",
                  "dataType":"20001",
                  "goodsModel":"20001",
                  "goodsName":"省内2G流量",
                  "goodsPrice":"56",
                  "goodsType":"",
                  "goodsSpecs":"2G",
                  "state":"1"
                }
              ]

            }
        },
      components:{
        NavHeader,
        NavFooter,
        MenuLeft,
        NavBread
      },
      methods:{
        batchCheck(){
          this.$router.push("/disResult")
        }

      }
    }
</script>
