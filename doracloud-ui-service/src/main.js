// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from './axios/http'
import Element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import 'normalize.css/normalize.css'// A modern alternative to CSS resets
import '@/styles/index.scss' // global css
// 引用axios，并设置基础URL为后端服
// 务api地址
// var axios = require('axios')
axios.defaults.baseURL = 'http://localhost:8003/alliance-security/'
// 将API方法绑定到全局
// Vue.prototype.$axios = axios
// Vue.config.productionTip = false
Vue.use(Element, {
  size: 'medium', // set element-ui default size
})
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  axios,
  components: { App },
  template: '<App/>'
})
