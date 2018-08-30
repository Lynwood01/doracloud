import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Model from '@/components/definition/Model'
import {Error, Auth} from '../views/'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
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
    },
    {
      path: '/model',
      name: 'Model',
      component: Model
    },
    {
      path: '/hello',
      name: 'HelloWorld',
      component: HelloWorld
    }
  ]
})
