import axios from 'axios';

// const SERVER_URL = process.env.VUE_APP_SERVER_URL;
const API_URL = 'https://dapi.kakao.com/v2/local/search/category.json';
const API_KEY = process.env.VUE_APP_REST_API_KEY;
// const CATEGORY_CODE = {};

const mapstore = {
  state: {
    conveniences: [],
    educations: [],
    traffics: [],
    medicals: [],
    cafes: [],
    cultures: [],
  },
  getters: {
    getConveniences(state) {
      return state.conveniences;
    },
    getEducations(state) {
      return state.educations;
    },
    getTraffics(state) {
      return state.traffics;
    },
    getMedicals(state) {
      return state.medicals;
    },
    getCafes(state) {
      return state.cafes;
    },
    getCultures(state) {
      return state.cultures;
    },
  },
  mutations: {
    CONVENIENCE(state, payload) {
      state.conveniences = payload;
    },
    EDUCATION(state, payload) {
      state.educations = payload;
    },
    TRAFFIC(state, payload) {
      state.traffics = payload;
    },
    MEDICAL(state, payload) {
      state.medicals = payload;
    },
    CAFE(state, payload) {
      state.cafes = payload;
    },
    CULTURE(state, payload) {
      state.cultures = payload;
    },
  },
  actions: {
    CONVENIENCE(store, payload) {
      return axios
        .all([getConv(payload), getMart(payload)])
        .then(
          axios.spread((conv, mart) => {
            console.log(
              '현재 [좌표]에서 검색된 [편의점]의 수 : ' +
                conv.data.documents.length
            );
            console.log(
              '현재 [좌표]에서 검색된 [대형마트]의 수 : ' +
                mart.data.documents.length
            );
            store.commit('CONVENIENCE', conv.data);
          })
        )
        .catch((err) => {
          console.error(err);
        });
    },
    // EDUCATION(store, payload) {},
    // TRAFFIC(store, payload) {},
    // MEDICAL(store, payload) {},
    // CAFE(store, payload) {},
    // CULTURE(store, payload) {},
  },
  modules: {},
};

function getConv(payload) {
  return axios.get(API_URL, {
    headers: { Authorization: `KakaoAK ${API_KEY}` },
    params: {
      category_group_code: 'CS2',
      x: payload.x,
      y: payload.y,
      radius: payload.radius,
    },
  });
}
function getMart(payload) {
  return axios.get(API_URL, {
    headers: { Authorization: `KakaoAK ${API_KEY}` },
    params: {
      category_group_code: 'MT1',
      x: payload.x,
      y: payload.y,
      radius: payload.radius,
    },
  });
}

export default mapstore;
