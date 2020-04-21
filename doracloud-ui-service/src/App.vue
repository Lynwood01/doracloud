<template>
  <div id="app">
    <!-- 其他页 -->
    <div v-if="$route.meta.keepAlive">
      <!--<el-header>-->
        <keep-alive>
          <!-- 导航栏 -->
          <nav-header></nav-header>
        </keep-alive>
     <!-- </el-header>-->
        <div v-if="$route.meta.leftAlive">
        <!--<el-aside>-->
          <!-- 侧边栏 -->
          <keep-alive>
          <menu-left></menu-left>
        </keep-alive>
        <!--</el-aside>-->
        </div>
        <!--<el-main>-->
          <!-- Body -->
          <router-view></router-view>
        <!--</el-main>-->
      <el-footer>
        <keep-alive>
          <!-- 底部 -->
          <nav-footer></nav-footer>
        </keep-alive>
      </el-footer>
    </div>

    <!-- 登录页 -->
    <router-view v-if="!$route.meta.keepAlive"></router-view>
  </div>
</template>
<script>
 // import "@/assets/css/common.css"
 import"@/assets/css/data.css"
 import"@/assets/css/new.css"
 import NavHeader from '@/components/header/head'
 import NavFooter from '@/components/footer/footer'
 import MenuLeft from '@/components/common/left'
 import NavBread from '@/components/common/bread'
 import NavHead from '@/components/common/head'
 import NavMenu from '@/components/common/menu'

 export default {
   name:"App",
   components:{
     NavHeader,
     NavHead,
     NavMenu,
     NavFooter,
     MenuLeft,
     NavBread
   }
 }
</script>
