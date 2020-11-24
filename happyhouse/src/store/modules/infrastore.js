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
    allCategory: [],
    totalIdx: 0,
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
    getAllCategory(state) {
      return [
        state.conveniences,
        state.educations,
        state.traffics,
        state.medicals,
        state.cafes,
        state.cultures,
      ];
    },
    getTotalIdx(state) {
      return state.totalIdx;
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
    TOTALIDX(state, payload) {
      state.totalIdx += payload;
    },
    INITIDX(state) {
      state.totalIdx = 0;
    },
  },
  actions: {
    ALLCATEGORY(store, payload) {
      store.commit('INITIDX');
      store.dispatch('CONVENIENCE', payload);
      store.dispatch('EDUCATION', payload);
      store.dispatch('TRAFFIC', payload);
      store.dispatch('MEDICAL', payload);
      store.dispatch('CAFE', payload);
      store.dispatch('CULTURE', payload);
    },
    CONVENIENCE(store, payload) {
      return axios
        .all([getConv(payload), getMart(payload)])
        .then(
          axios.spread((res1, res2) => {
            console.log('[편의점]의 수 : ' + res1.data.documents.length);
            console.log('[대형마트]의 수 : ' + res2.data.documents.length);
            let idx = calidx('CONVENIENCE', {
              a: res1.data.documents.length,
              adist: getDistance(
                res1.data.documents.length,
                res1.data.documents[0]
              ),
              b: res2.data.documents.length,
              bdist: getDistance(
                res2.data.documents.length,
                res2.data.documents[0]
              ),
            });
            store.commit('TOTALIDX', idx);
            store.commit(
              'CONVENIENCE',
              Object.assign(res1.data.documents, res2.data.documents, {
                idx,
              })
            );
          })
        )
        .catch((err) => {
          console.error(err);
        });
    },
    EDUCATION(store, payload) {
      return axios
        .all([getSchool(payload), getPSchool(payload)])
        .then(
          axios.spread((res1, res2) => {
            console.log('[학교]의 수 : ' + res1.data.documents.length);
            console.log('[학원]의 수 : ' + res2.data.documents.length);
            let idx = calidx('EDUCATION', {
              a: res1.data.documents.length,
              adist: getDistance(
                res1.data.documents.length,
                res1.data.documents[0]
              ),
              b: res2.data.documents.length,
              bdist: getDistance(
                res2.data.documents.length,
                res2.data.documents[0]
              ),
            });
            store.commit('TOTALIDX', idx);
            store.commit(
              'EDUCATION',
              Object.assign(res1.data.documents, res2.data.documents, {
                idx,
              })
            );
          })
        )
        .catch((err) => {
          console.error(err);
        });
    },
    TRAFFIC(store, payload) {
      return getMetro(payload)
        .then((res) => {
          console.log('[지하철]의 수 : ' + res.data.documents.length);
          let idx = calidx('TRAFFIC', {
            a: res.data.documents.length,
            adist: getDistance(
              res.data.documents.length,
              res.data.documents[0]
            ),
          });
          store.commit('TOTALIDX', idx);
          store.commit(
            'TRAFFIC',
            Object.assign(res.data.documents, {
              idx,
            })
          );
        })
        .catch((err) => {
          console.log(err);
        });
    },
    MEDICAL(store, payload) {
      return axios
        .all([getHospital(payload), getDrugstore(payload)])
        .then(
          axios.spread((res1, res2) => {
            console.log('[병원]의 수 : ' + res1.data.documents.length);
            console.log('[약국]의 수 : ' + res2.data.documents.length);
            let idx = calidx('MEDICAL', {
              a: res1.data.documents.length,
              adist: getDistance(
                res1.data.documents.length,
                res1.data.documents[0]
              ),
              b: res2.data.documents.length,
              bdist: getDistance(
                res2.data.documents.length,
                res2.data.documents[0]
              ),
            });
            store.commit('TOTALIDX', idx);
            store.commit(
              'MEDICAL',
              Object.assign(res1.data.documents, res2.data.documents, {
                idx,
              })
            );
          })
        )
        .catch((err) => {
          console.log(err);
        });
    },
    CAFE(store, payload) {
      return getCafe(payload)
        .then((res) => {
          console.log('[카페]의 수 : ' + res.data.documents.length);
          let idx = calidx('CAFE', {
            a: res.data.documents.length,
            adist: getDistance(
              res.data.documents.length,
              res.data.documents[0]
            ),
          });
          store.commit('TOTALIDX', idx);
          store.commit(
            'CAFE',
            Object.assign(res.data.documents, {
              idx,
            })
          );
        })
        .catch((err) => {
          console.log(err);
        });
    },
    CULTURE(store, payload) {
      return getCulture(payload)
        .then((res) => {
          console.log('[문화시설]의 수 : ' + res.data.documents.length);
          let idx = calidx('CULTURE', {
            a: res.data.documents.length,
            adist: getDistance(
              res.data.documents.length,
              res.data.documents[0]
            ),
          });
          store.commit('TOTALIDX', idx);
          store.commit(
            'CULTURE',
            Object.assign(res.data.documents, {
              idx,
            })
          );
        })
        .catch((err) => {
          console.log(err);
        });
    },
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
      size: 5,
      sort: 'distance',
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
      size: 5,
      sort: 'distance',
    },
  });
}
function getSchool(payload) {
  return axios.get(API_URL, {
    headers: { Authorization: `KakaoAK ${API_KEY}` },
    params: {
      category_group_code: 'SC4',
      x: payload.x,
      y: payload.y,
      radius: payload.radius,
      size: 5,
      sort: 'distance',
    },
  });
}
function getPSchool(payload) {
  return axios.get(API_URL, {
    headers: { Authorization: `KakaoAK ${API_KEY}` },
    params: {
      category_group_code: 'AC5',
      x: payload.x,
      y: payload.y,
      radius: payload.radius,
      size: 5,
      sort: 'distance',
    },
  });
}
function getMetro(payload) {
  return axios.get(API_URL, {
    headers: { Authorization: `KakaoAK ${API_KEY}` },
    params: {
      category_group_code: 'SW8',
      x: payload.x,
      y: payload.y,
      radius: payload.radius,
      size: 5,
      sort: 'distance',
    },
  });
}
function getCulture(payload) {
  return axios.get(API_URL, {
    headers: { Authorization: `KakaoAK ${API_KEY}` },
    params: {
      category_group_code: 'CT1',
      x: payload.x,
      y: payload.y,
      radius: payload.radius,
      size: 5,
      sort: 'distance',
    },
  });
}
function getCafe(payload) {
  return axios.get(API_URL, {
    headers: { Authorization: `KakaoAK ${API_KEY}` },
    params: {
      category_group_code: 'CE7',
      x: payload.x,
      y: payload.y,
      radius: payload.radius,
      size: 5,
      sort: 'distance',
    },
  });
}
function getHospital(payload) {
  return axios.get(API_URL, {
    headers: { Authorization: `KakaoAK ${API_KEY}` },
    params: {
      category_group_code: 'HP8',
      x: payload.x,
      y: payload.y,
      radius: payload.radius,
      size: 5,
      sort: 'distance',
    },
  });
}
function getDrugstore(payload) {
  return axios.get(API_URL, {
    headers: { Authorization: `KakaoAK ${API_KEY}` },
    params: {
      category_group_code: 'PM9',
      x: payload.x,
      y: payload.y,
      radius: payload.radius,
      size: 5,
      sort: 'distance',
    },
  });
}

function getDistance(cnt, doc) {
  if (cnt == 0) return 1000;
  else return doc.distance;
}

function calidx(category, info) {
  let cal = 0.0;
  switch (category) {
    case 'CONVENIENCE':
      if (info.a >= 1) {
        cal += 2;
        if (info.adist <= 500) cal += 0.5;
        if (info.a >= 3) cal += 0.5;
      }
      if (info.b >= 1) {
        cal += 2;
      }
      return cal;
    case 'EDUCATION':
      if (info.a >= 1) {
        cal += 3;
        if (info.adist <= 500) cal += 1;
        else if (info.adist <= 700) cal += 0.5;
      }
      if (info.b >= 1) {
        cal += 1;
      }
      return cal;
    case 'TRAFFIC':
      if (info.a >= 1) {
        cal += 3;
        if (info.adist <= 500) cal += 2;
        else if (info.adist <= 700) cal += 1;
        else if (info.adist <= 900) cal += 0.5;
      } else cal += 1.5;
      return cal;
    case 'MEDICAL':
      if (info.a >= 1) {
        cal += 2;
      } else if (info.a >= 2) {
        cal += 3;
      }
      if (info.b >= 1) {
        cal += 2;
      }
      return cal;
    case 'CAFE':
      if (info.a >= 1) {
        cal += 2;
        if (info.a >= 3) cal += 1;
        if (info.adist <= 500) cal += 2;
        else if (info.adist <= 700) cal += 1;
        else if (info.adist <= 900) cal += 0.5;
      }
      return cal;
    case 'CULTURE':
      if (info.a >= 1) cal += 2;
      cal += info.a;
      return cal >= 5 ? 5 : cal;
  }
}

export default mapstore;
