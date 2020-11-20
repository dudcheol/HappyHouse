import Vue from 'vue'
import App from './App.vue'
// import router from './router';
import mapstore from './store/mapstore.js';

Vue.config.productionTip = false

new Vue({
  // router,
  store: mapstore,
  render: h => h(App),
}).$mount('#app')
