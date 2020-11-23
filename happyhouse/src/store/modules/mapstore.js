import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

const SERVER_URL = process.env.VUE_APP_SERVER_URL;
// const GEOCODE_KEY = process.env.VUE_APP_GEOCODE_KEY;

const mapstore = {
  state: {
    houseInfos: [],
    selectedInfosByLatlng: [],
  },
  getters: {
    getHouseInfos(state) {
      return state.houseInfos;
    },
    getSelectedInfosByLatlng(state) {
      return state.selectedInfosByLatlng;
    },
  },
  mutations: {
    HOUSEINFO(state, payload) {
      state.houseInfos = payload;
    },
    SEARCHBYLATLNG(state, payload) {
      state.selectedInfosByLatlng = payload;
    },
  },
  actions: {
    // HOUSEINFO: (store) => {
    //   return axios
    //     .get(`${SERVER_URL}/map/housedeal/내수동`)
    //     .then((res) => {
    //       store.commit('HOUSEINFO', res.data);
    //     })
    //     .catch((err) => {
    //       console.error(err);
    //     });
    // },

    MOVEMAP: (store, payload) => {
      return axios
        .get(`${SERVER_URL}/map/range`, {
          params: payload,
        })
        .then((res) => {
          store.commit('HOUSEINFO', res.data);
          console.log(
            '현재 [지도 범위]에서 [' +
              res.data.length +
              ']개의 거래정보를 발견했습니다!'
          );
        })
        .catch((err) => {
          console.error(err);
        });
    },

    SEARCHBYLATLNG: (store, payload) => {
      return axios
        .get(`${SERVER_URL}/map/search/latlng`, {
          params: payload,
        })
        .then((res) => {
          store.commit('SEARCHBYLATLNG', res.data);
          console.log(
            '현재 [좌표]에서 [' +
              res.data.length +
              ']개의 거래정보를 발견했습니다!'
          );
        })
        .catch((err) => {
          console.error(err);
        });
    },
  },
  modules: {},
};

export default mapstore;
