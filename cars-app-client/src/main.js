import Vue from 'vue';
import App from './App.vue';
import router from './core/router';
import VueAWN from "vue-awesome-notifications"
import 'clickout-event';
import './styles/main.scss';
import { awnOptions } from '@/utils';
import Treeselect from '@riophae/vue-treeselect';
Vue.config.productionTip = false

Vue.use(VueAWN, awnOptions);
Vue.component('treeselect', Treeselect);
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
