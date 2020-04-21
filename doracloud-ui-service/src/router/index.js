import Vue from 'vue'
import Router from 'vue-router'
// import {Error, Auth} from '@/views/'
import Login from '@/views/sys/login'
import Index from '@/views/sys/index'
import Regist from '@/views/sys/regist'
import Info from '@/views/sys/info'
import Goods from '@/views/goods/goods'
import Contract from '@/views/contract/contract'
import ContractDetail from '@/views/contract/detail'
import Order from '@/views/order/order'
import OrderDetail from '@/views/order/details'
import Distribution from '@/views/data/distribution'
import TrafficDis from '@/views/data/trafficDis'
import Inventory from '@/views/data/inventory'
import Buy from '@/views/data/buy'
import OrderConfirm from '@/views/data/confirm'
import Pay from '@/views/data/pay'
import Bill from '@/views/bill/bill'
import BillDetail from '@/views/bill/detail'
import DistributionResult from '@/views/data/distributionResult'
import RegistSuccess from '@/views/sys/registSuccess'
import Auth404 from '@/components/auth/404'
import Auth500 from '@/components/auth/500'
import Error from '@/components/auth/sorry'
Vue.use(Router)
const router =  new Router({
  mode: 'hash',
  routes: [
   /* {
      path: '/',
      component: resolve => require(['../views/layout/index.vue'], resolve),
      redirect: {name: 'Login'},
      children: [{
        meta: {
          name: '用户登录',
          noRequiredAuth: true
        },
        name: 'Login',
        path: 'login',
        component: Auth.Login
      },
        {
        path: '*',
        component: Error.NotFoundPage
      }]
    },*/
    {
      path: '/login',
      name: 'login',
      component:Login ,
      meta: {
        keepAlive: false,
        leftAlive:false
      }
      /*children:[
        {
        path: 'title',
        name: 'title',
        component: title,
      },
        {
        path: 'image',
        name: 'image',
        component: image,
      },
        {
          path: 'cart',
          name: 'cart',
          component: Cart,
        },
        {
          path: 'details',
          name: 'details',
          component: details,
        }
      ]*/
    }, {
      path: '/index',
      name: 'index',
      component: Index,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    },
    {
      path: '/regist',
      name: 'regist',
      component: Regist,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    },{
      path: '/registSucc',
      name: 'registSuccess',
      component: RegistSuccess,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    },{
      path: '/404',
      name: '404',
      component: Auth404,
      meta: {
        keepAlive: false,
        leftAlive:false
      }
    },{
      path: '/500',
      name: '500',
      component: Auth500,
      meta: {
        keepAlive: false,
        leftAlive:false
      }
    },{
      path: '/error',
      name: 'error',
      component: Error,
      meta: {
        keepAlive: false,
        leftAlive:false
      }
    },{
      path: '/goods',
      name: 'goods',
      component: Goods,
      meta: {
        requireAuth: true,
        keepAlive: true,
        leftAlive:true
      }
    },{
      path: '/info',
      name: 'info',
      component: Info,
      meta: {
        // requireAuth: true,
        keepAlive: true,
        leftAlive:true
      }
    },{
      path: '/contract',
      name: 'contract',
      component: Contract,
      meta: {
        keepAlive: true,
        leftAlive:true
      }
    },{
      path: '/contract/detail',
      name: 'detail',
      component: ContractDetail,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    },{
      path: '/order',
      name: 'order',
      component: Order,
      meta: {
        keepAlive: true,
        leftAlive:true
      }
    }, {
    path: '/order/detail',
    name: 'detail',
    component: OrderDetail,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
   },{
      path: '/distribution',
      name: 'distribution',
      component: Distribution,
      meta: {
        keepAlive: true,
        leftAlive:true
      }
    },{
      path: '/trafficDis',
      name: 'trafficDis',
      component: TrafficDis,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    },{
      path: '/inventory',
      name: 'inventory',
      component: Inventory,
      meta: {
        keepAlive: true,
        leftAlive:true
      }
    },{
      path: '/disResult',
      name: 'distributionResult',
      component:DistributionResult,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    },{
      path: '/buy',
      name: 'buy',
      component:Buy,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    },{
      path: '/buy/confirm',
      name: 'confirm',
      component:OrderConfirm,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    },{
      path: '/buy/pay',
      name: 'pay',
      component:Pay,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    },{
      path: '/bill',
      name: 'bill',
      component:Bill,
      meta: {
        keepAlive: true,
        leftAlive:true
      }
    },{
      path: '/bill/detail',
      name: 'detail',
      component:BillDetail,
      meta: {
        keepAlive: true,
        leftAlive:false
      }
    }
  ]
})
  // 判断是否需要登录权限 以及是否登录
  router.beforeEach((to, from, next) => {
if(to.matched.length<=0){
  next(
    {
      path: '/404'
    })
}else{
  if (to.matched.some(res => res.meta.requireAuth)) {// 判断是否需要登录权限
    if (localStorage.getItem('username')) {// 判断是否登录
      next()
    } else {// 没登录则跳转到登录界面
      next({
        path: '/login'
        // query: {redirect: to.fullPath}
      })
    }
  } else {
    next()
  }
}


})
export default router
