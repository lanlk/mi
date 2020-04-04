import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import {request} from "@/myCode/request"

Vue.config.productionTip = false
//设置全局函数
Vue.prototype.$http = request;
// Vue.prototype.a = 321;

new Vue({
  router,
  store,
  // Swiper,
  render: h => h(App)
}).$mount('#app')
