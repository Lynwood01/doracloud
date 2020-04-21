<template>
  <div class="left clearfix">
    <div class="account">
      <div class="account-top">
        <a href="javascript:;" class="user-photo">
          <img src="/static/images/user_head.jpg" alt="用户头像">
          <span class="span_01"></span>
        </a>
        <div class="left-user">
          <span class="center-name-span">${cust.custName}</span><br/>
          <span>合作伙伴</span><a class="logout" href="javascript: logout();">[退出]</a>
        </div>
      </div>
      <div class="account-middle">
        <div class="ac-1">分销账户</div>
        <p class="line"></p>
      </div>
      <div class="yue">
        <div><span class="span_02">可用余额：</span><span class="span_03">{{1000}}元</span></div>
        <div class="mt10"><span class="span_02">冻结余额：</span><span class="span_03">{{1000}}元</span></div>
      </div>
    </div>
    <ul class="left-menu" >
      <li v-for="(menu,index) in menuList "  v-bind:class="{'active':menuActive==index}">
        <a href="javaScript:;"  @click="menuClick(index,menu.url)"><i v-bind:class="menu.ico"></i>{{menu.name}}</a>
      </li>
    </ul>
  </div>
</template>
<script>
    export default {
        data() {
            return {
              menuList:[{
              "url":"/info",
              "ico":"l-ico ico1",
              "name":"我的资料"},
                {
                "url":"/contract",
                "ico":"l-ico ico2",
                "name":"我的合同"},
                {
                "url":"/distribution",
                  "ico":"l-ico ico3",
                "name":"我的分销"},
                {
                "url":"/order",
                  "ico":"l-ico ico4",
                "name":"我的订单"},
                {
                "url":"/bill",
                  "ico":"l-ico ico5",
                "name":"我的账单"},
                {
                "url":"/inventory",
                  "ico":"l-ico ico6",
                "name":"我的清单"},
                {
                "url":"/goods",
                  "ico":"l-ico ico6",
                "name":"流量商品"}
              ],
               menuActive:0,
               seen:true}
        },methods:{
        menuEnter(index){
          // if(this.menuActive==null)
             this.menuActive=index;
          this.seen=true
          // this.jump(url);
        },menuClick(index,url){
            this.menuActive=index;
            this.seen=true
            this.jump(url);
          },
        jump(url){
          this.$router.push(url)

        }
      }
    }
</script>
