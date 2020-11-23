import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

const SERVER_URL = process.env.VUE_APP_SERVER_URL;
// const GEOCODE_KEY = process.env.VUE_APP_GEOCODE_KEY;

export default new Vuex.Store({
  state: {
    houseInfos: [],
    // markers: [],
  },
  getters: {
    getHouseInfos(state) {
      return state.houseInfos;
    },
    // getMarkers(state) {
    //   return state.markers;
    // },
  },
  mutations: {
    HOUSEINFO(state, payload) {
      state.houseInfos = payload;
    },
    // GEOCODE(state, payload) {
    //   state.markers = payload;
    // },
  },
  actions: {
    HOUSEINFO: (store) => {
      return axios
        .get(`${SERVER_URL}/map/housedeal/내수동`)
        .then((res) => {
          store.commit('HOUSEINFO', res.data);
        })
        .catch((err) => {
          console.error(err);
        });
    },

    MOVEMAP: (store, payload) => {
      return axios
        .get(`${SERVER_URL}/map/range`, {
          params: payload,
        })
        .then((res) => {
          store.commit('HOUSEINFO', res.data);
          console.log(res.data.length + '개의 거래정보를 발견했습니다!');
        })
        .catch((err) => {
          console.error(err);
        });
    },

    // GEOCODE: (store, payload) => {
    //   let tmpMarkers = [];
    //   // let tmpLat;
    //   // let tmpLng;
    //   payload.forEach((data) => {
    //     let address = data.dong + '+' + data.aptName + '+' + data.jibun;
    //     axios
    //       .get(
    //         `https://maps.googleapis.com/maps/api/geocode/json?key=${GEOCODE_KEY}&address=${address}`
    //       )
    //       .then((res) => {
    //         data.lat = res.data.results[0].geometry.location.lat;
    //         data.lng = res.data.results[0].geometry.location.lng;
    //         tmpMarkers.push({
    //           lat: res.data.results[0].geometry.location.lat,
    //           lng: res.data.results[0].geometry.location.lng,
    //           aptName: data.aptName,
    //           no: data.no,
    //         });
    //       })
    //       .catch((err) => {
    //         console.error(err);
    //       });
    //   });

    //   store.commit('GEOCODE', tmpMarkers);
    // },
  },
  modules: {},
});
