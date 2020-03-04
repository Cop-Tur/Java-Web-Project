import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui'
import axios from 'axios'
import VueAxios from "vue-axios"
import 'element-ui/lib/theme-chalk/index.css'

Vue.use(ElementUI);
Vue.use(VueAxios,axios);

//反向代理
/*var axios = require('axios');*/
axios.defaults.baseURL = 'http://localhost:8081/';
//全局配置 通过this.$axios发数据
Vue.prototype.$axios = axios;

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
