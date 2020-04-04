import Vue from 'vue'
import VueRouter from 'vue-router'

// const Index = () => import('../views/Index')
// const UserCenter = () => import('../views/UserCenter')

Vue.use(VueRouter)

const routes = [
  {
    path: '',
    redirect: '/index'
  },
  {
    path: '/index',
	name: 'index',
    component: () => import('../views/Index')
  },
  {
    path: '/userCenter',
	name: 'userCenter',
    component: () => import('../views/UserCenter')
  },
  {
    path: '/goods',
	name: 'goods',
    component: () => import('../views/Goods')
  },
  {
    path: '/goodsDetail/:id',
  	name: 'goodsDetail',
    component: () => import('../views/GoodsDetail')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('../views/Login')
  },
  {
    path: '/registers',
	name: 'registers',
    component: () => import('../views/Registers')
  },
  {
    path: '/forget',
	name: 'forget',
    component: () => import('../views/Forget')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
