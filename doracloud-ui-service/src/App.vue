<template>
  <div id="app" >
      <auth-header></auth-header>
          <router-view></router-view>
      <auth-footer></auth-footer>
  </div>
</template>
<script>
  import AuthHeader from './views/layout/header/index.vue';
  import AuthFooter from './views/layout/footer/index.vue';
  export default {
    components: {
      AuthHeader,
      AuthFooter
    }
  };
</script>

<style>
/*#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  text-align: center;
  width: auto;
  height: 100%;
  color: #2c3e50;
  margin-top: 50px;
}*/
#app{
	height: 100%;
}
 .w {
    width: 100%;
    margin: 0 auto;
  }
  .auth-contanier {
    background-color: #f8f8f8;
    position: relative;
    min-height: 670px;
    height: 100%;
  }
  .main {
    height: 100%;
    padding: 0 0;
  }
</style>
