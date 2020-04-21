<template>
  <div class="left clearfix">
    <div class="account">
      <div class="account-top">
        <a href="javascript:;" class="user-photo">
          <img src="/static/images/user_head.jpg" alt="用户头像">
          <span class="span_01"></span>
        </a>
        <div class="left-user">
          <span class="center-name-span">张三</span><br/>
          <span>合作伙伴</span><a class="logout" href="javascript: logout();">[退出]</a>
        </div>
      </div>
      <div class="account-middle">
        <div class="ac-1">分销账户</div>
        <p class="line"></p>
      </div>
      <div class="yue">
        <div><span class="span_02">可用余额：</span><span class="span_03">1000元</span></div>
        <div class="mt10"><span class="span_02">冻结余额：</span><span class="span_03">1000元</span></div>
      </div>
    </div>

  <el-aside width="250px">
    <el-menu :default-openeds="['1']" >
      <el-menu-item index="index" v-for="(menu,index) in menuList" :key="menu.url" v-bind:class="{'is-active':menuActive==index}" @click="menuClick(index,menu.url)">
        <i v-bind:class="menu.ico"></i>{{menu.name}}</el-menu-item>
      <!--<el-submenu index="index" v-for="(menu,index) in menuList">-->
        <!--<template slot="title"><i v-bind:class="menu.ico"></i>{{menu.name}}</template>-->
      <!--  <el-menu-item-group>
          <template slot="title">分组一</template>
          <el-menu-item index="1-1">选项1</el-menu-item>
          <el-menu-item index="1-2">选项2</el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group title="分组2">
          <el-menu-item index="1-3">选项3</el-menu-item>
        </el-menu-item-group>
        <el-submenu index="1-4">
          <template slot="title">选项4</template>
          <el-menu-item index="1-4-1">选项4-1</el-menu-item>
        </el-submenu>-->
      <!--</el-submenu>-->
    </el-menu>
  </el-aside>
  </div>
</template>
<style>
  .el-menu-item.is-active{
    color: #000000;
  }
</style>
<script>
    export default {
        data() {
            return { menuList:[{
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
        },
      methods:{
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
