<template>
      <!--<div class="contaniner">-->
        <!--<nav-header></nav-header>-->
      <div class="main clearfix">
        <el-carousel :interval="5000" arrow="always">
          <el-carousel-item v-for="item in 4" :key="item">
            <ul class="slides">
              <li></li>
              <li></li>
              <li></li>
            </ul>
          </el-carousel-item>
        </el-carousel>
        <div class="item-group clearfix">
          <div class="index-item">
            <a href="javascript:;">
              <span class="index-ico ico1"></span>
              <span>客户注册</span>
            </a>
          </div>
          <div class="index-item">
            <a href="javascript:;">
              <span class="index-ico ico2"></span>
              <span>业务订购</span>
            </a>
          </div>
          <div class="index-item">
            <a href="javascript:;">
              <span class="index-ico ico3"></span>
              <span>支付缴费</span>
            </a>
          </div>
          <div class="index-item">
            <a href="javascript:;">
              <span class="index-ico ico4"></span>
              <span>商品发货</span>
            </a>
          </div>
          <div class="index-item">
            <a href="javascript:;">
              <span class="index-ico ico5"></span>
              <span>流量分支</span>
            </a>
          </div>
          <div class="index-item">
            <a href="javascript:;">
              <span class="index-ico ico6"></span>
              <span>计费结算</span>
            </a>
          </div>
          <div class="index-item">
            <a href="javascript:;">
              <span class="index-ico ico7"></span>
              <span>账务处理</span>
            </a>
          </div>
          <div class="index-item">
            <a href="javascript:;">
              <span class="index-ico ico8"></span>
              <span>发票申请</span>
            </a>
          </div>
        </div>
        <div class="reg-box">
          <router-link class="normal-btn" to="/regist">去注册</router-link>
        </div>
        <div class="act-desc">
          <div class="act">
            <h1 class="act-title">有哪些活动?</h1>
            <p class="act-content">电信传统流量包，对应PPM配置的销售品。如：省内100M流量包、全国1G流量包。一个快销品流量包仅能以整体进行购买、使用，转增。根据快销品购买的时间，其有效期可能不同。在平台购买的快销品留存在平台，平台有效期默认为1年。充值到手机账户后遵循流量包使用规则</p>
            <div class="act-list clearfix">
              <div class="act-item">
                <div class="act-inner">
                  <div class="act-tit">流量卡、券</div>
                  <img src="/static/images/index1.jpg" alt="">
                  <p>描述：电信传统流量包，对应PPM配置的销售品。如：省内100M流量包、全国1G流量包。一个快销品流量包仅能以整体进行购买、使用，转增。</p>
                </div>
              </div>
              <div class="act-item">
                <div class="act-inner">
                  <div class="act-tit">流量红包</div>
                  <img src="/static/images/index2.png" alt="">
                  <p>描述：电信传统流量包，对应PPM配置的销售品。如：省内100M流量包、全国1G流量包。一个快销品流量包仅能以整体进行购买、使用，转增。</p>
                </div>
              </div>
              <div class="act-item al">
                <div class="act-inner">
                  <div class="act-tit">流量卡、券</div>
                  <img src="/static/images/index3.jpg" alt="">
                  <p>描述：电信传统流量包，对应PPM配置的销售品。如：省内100M流量包、全国1G流量包。一个快销品流量包仅能以整体进行购买、使用，转增。</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        <!--<nav-footer></nav-footer>-->
      <!--</div>-->
     <!-- <script src="${ctxStatic}/flexslider/jquery.flexslider-min.js" type="text/javascript"></script>
      <script type="text/javascript" >
        $(function(){
          $('.flexslider').flexslider({
            slideshowSpeed: 5000,
            directionNav: true,
            pauseOnAction: false
          });

          $('.act-item').hover(function(){
            $(this).addClass('on');
            var wl = 350;
            var hl = 200;
            $(this).find('.act-inner').css('left', -wl / 4);
            $(this).find('.act-inner').css('top', -hl / 4);
          },function() {
            $(this).animate({
                height: "200px"
              },
              100).removeClass('on');
            $(this).find('.act-inner').css('left', '0')
          });
        });
      </script>-->
</template>
<script>
  import './../../assets/css/common.css'
  import './../../assets/css/index.css'
  import './../../assets/css/flexslider/flexslider.css'
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
    export default {
        data() {
            return {msg: '初始代模板'}
        },
      components:{
        NavHeader,
        NavFooter
      }
    }
</script>
