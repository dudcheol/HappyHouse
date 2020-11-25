import axios from 'axios';

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

const reviewstore = {
  state: {
    reviews: [],
    // reviews: [
    //   { title: 'title', content: 'content', date: '2020/22/22', star: '2.5' },
    // ],
  },
  getters: {
    getReviews(state) {
      return state.reviews;
    },
  },
  mutations: {
    REVIEW(state, payload) {
      state.reviews = payload;
    },
  },
  actions: {
    REVIEW(store, payload) {
      console.log(JSON.stringify(payload));
      return axios
        .get(`${SERVER_URL}/reviewdata`, {
          params: payload,
        })
        .then((res) => {
          console.log('받아온 [리뷰] : ' + JSON.stringify(res.data));
          store.commit('REVIEW', res.data);
        })
        .catch((err) => {
          console.error(err);
        });
    },
  },
  modules: {},
};

export default reviewstore;
