import Vue from 'vue';
import App from './App.vue';
import router from './router';
import VueAWN from "vue-awesome-notifications"
import 'clickout-event';
import './styles/main.scss';
import { awnOptions } from '@/utils';
Vue.config.productionTip = false

Vue.use(VueAWN, awnOptions);
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
