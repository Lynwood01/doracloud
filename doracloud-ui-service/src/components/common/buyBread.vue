<template>
  <div class="nav-bar">
    <i class="bar-ico"></i>

    <slot name="buy">
      <a href="javascript:;">流量购买</a>&nbsp;&gt;&nbsp;
    </slot>
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
