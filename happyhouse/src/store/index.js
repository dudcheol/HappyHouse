import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

import mapstore from '@/store/modules/mapstore.js';
import infrastore from '@/store/modules/infrastore.js';
import reviewstore from '@/store/modules/reviewstore.js';

const store = new Vuex.Store({
  modules: {
    mapstore,
    infrastore,
    reviewstore,
  },
});

export default store;
