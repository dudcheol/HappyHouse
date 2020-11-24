import axios from 'axios';

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

const mapstore = {
  state: {
    houseInfos: [],
    selectedInfosByLatlng: [],
    filters: {},
  },
  getters: {
    getHouseInfos(state) {
      return state.houseInfos;
    },
    getSelectedInfosByLatlng(state) {
      return state.selectedInfosByLatlng;
    },
    getFilters(state) {
      return state.filters;
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
