import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

import mapstore from '@/store/modules/mapstore.js';
import infrastore from '@/store/modules/infrastore.js';

const store = new Vuex.Store({
  modules: {
    mapstore,
    infrastore,
  },
});

export default store;
