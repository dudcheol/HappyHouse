<template>
  <div>
    <map-input></map-input>
    <div id="map" class="map"></div>
  </div>
</template>

<script>
import MapInput from '../components/map/MapInput.vue';
import { mapGetters, mapActions } from 'vuex';

const MAP_APP_KEY = process.env.VUE_APP_MAP_APP_KEY;

export default {
  components: { MapInput },
  data() {
    return {};
  },

  mounted() {
    window.kakao && window.kakao.maps
      ? this.initMap()
      : this.addKakaoMapScript();

    this.HOUSEINFO();
    this.GEOCODE(this.getHouseInfos);
  },

  computed: {
    ...mapGetters(['getHouseInfos', 'getMarkers']),
  },

  methods: {
    ...mapActions(['HOUSEINFO', 'GEOCODE']),

    addKakaoMapScript() {
      const script = document.createElement('script');
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=' +
        MAP_APP_KEY;
      document.head.appendChild(script);
    },

    initMap() {
      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      var options = {
        //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(37.5665734, 126.978179), //지도의 중심좌표.
        level: 3, //지도의 레벨(확대, 축소 정도)
      };

      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체
      console.log(map);
    },
  },
};
</script>

<style>
.map {
  width: 100%;
  min-height: 100vh;
}
</style>
