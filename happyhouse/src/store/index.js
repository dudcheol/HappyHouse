import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

import mapstore from '@/store/modules/mapstore.js';

const store = new Vuex.Store({
  modules: {
    mapstore: mapstore,
  },
});

export default store;
