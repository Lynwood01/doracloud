<template>
  <div class="nav-bar">
    <i class="bar-ico"></i>
    <slot v-if="$route.params.type==null" name="center">
      <a href="javascript:;">个人中心</a>&nbsp;&gt;&nbsp;
    </slot>
    <!--<slot  v-if="$route.params.type==2"name="buy">-->
      <!--<a href="javascript:;">流量购买</a>&nbsp;&gt;&nbsp;-->
    <!--</slot>-->
    <!--<slot  v-if="$route.params.type==3"name="distribution">-->
      <!--<a href="javascript:;">流量分销</a>&nbsp;&gt;&nbsp;-->
    <!--</slot>-->
    <slot></slot>
  </div>
</template>
<script>
    export default {
        data() {
            return {msg: '初始代模板'}
        }
    }
</script>
