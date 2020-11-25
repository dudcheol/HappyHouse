<template>
  <div id="app">
    <!-- <b-navbar toggleable="lg" type="dark" variant="dark">
      <b-container>
        <b-navbar-brand href="#" class="font-weight-bold"
          >SSAPBANG</b-navbar-brand
        >

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav class="ml-auto">
            <b-nav-item>Q&A 게시판</b-nav-item>
            <b-nav-item>자주묻는 질문</b-nav-item>
            <b-nav-item>공지사항</b-nav-item>
            <div v-if="!userid">
              <b-button variant="primary">로그인</b-button>
            </div>
            <div v-else-if="userid == 'admin'" class="">
              <b-nav-item><kbd>TEST</kbd>님 안녕하세요!</b-nav-item>
              <b-nav-item
                ><b-button variant="info">괸리자페이지</b-button></b-nav-item
              >
              <b-nav-item><b-button>로그아웃</b-button></b-nav-item>
            </div>
            <div v-else>
              <b-nav-item><kbd>TEST</kbd>님 안녕하세요!</b-nav-item>
              <b-nav-item
                ><b-button variant="info">마이페이지</b-button></b-nav-item
              >
              <b-nav-item><b-button>로그아웃</b-button></b-nav-item>
            </div>
          </b-navbar-nav>
        </b-collapse>
      </b-container>
    </b-navbar> -->
    <Map></Map>
  </div>
</template>

<script>
import Vue from 'vue';
import Map from '@/views/Map.vue';
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue';

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);

import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

export default {
  name: 'App',
  components: {
    Map,
  },
  // data() {
  //   return {
  //     userid: 'admin',
  //   };
  // },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
