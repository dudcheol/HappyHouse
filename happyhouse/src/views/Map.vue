<template>
  <div>
    <b-sidebar
      id="detail-info-sidebar"
      v-model="isSidebarOpen"
      title=""
      right
      width="428px"
      shadow="lg"
      bg-variant="white"
    >
      <info-detail :selectedInfo="selectedInfo"></info-detail>
    </b-sidebar>
    <map-input></map-input>
    <div id="map" class="map"></div>
  </div>
</template>

<script>
import MapInput from '../components/map/MapInput.vue';
import InfoDetail from '../components/map/InfoDetail.vue';
// import axios from 'axios';
import { mapGetters, mapActions } from 'vuex';

const MAP_APP_KEY = process.env.VUE_APP_MAP_APP_KEY;
// const GEOCODE_KEY = process.env.VUE_APP_GEOCODE_KEY;

export default {
  components: { MapInput, InfoDetail },
  data() {
    return {
      map: null,
      markers: [],
      isSidebarOpen: false,
      selectedInfo: {},
    };
  },

  mounted() {
    window.kakao && window.kakao.maps
      ? this.initMap()
      : this.addKakaoMapScript();
  },

  computed: {
    ...mapGetters(['getHouseInfos']),
  },

  watch: {
    getHouseInfos: function(val) {
      this.updateMap(val);
    },
  },

  methods: {
    ...mapActions(['HOUSEINFO']),

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
        level: 4, //지도의 레벨(확대, 축소 정도)
      };

      this.map = new kakao.maps.Map(container, options); //지도 생성 및 객체

      var mapTypeControl = new kakao.maps.MapTypeControl();
      this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      var zoomControl = new kakao.maps.ZoomControl();
      this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      this.HOUSEINFO();
    },

    updateMap(houseinfos) {
      for (var i = 0; i < houseinfos.length; i++) {
        var position = new kakao.maps.LatLng(
          houseinfos[i].lat,
          houseinfos[i].lng
        );
        this.addMarker(this.map, position, houseinfos[i]);
        // console.log(JSON.stringify(data));
      }

      // houseinfos.forEach((data) => {
      //   // console.log(data.lng);
      //   try {
      //     var position = new kakao.maps.LatLng(data.lat, data.lng);
      //     this.addMarker(this.map, position, data);
      //   } catch (e) {
      //     console.log(e);
      //     // console.log(JSON.stringify(data));
      //   }
      //   // let address = data.dong + '+' + data.aptName + '+' + data.jibun;
      //   // axios
      //   //   .get(
      //   //     `https://maps.googleapis.com/maps/api/geocode/json?key=${GEOCODE_KEY}&address=${address}`
      //   //   )
      //   //   .then((res) => {
      //   //     var marker = new kakao.maps.LatLng(
      //   //       res.data.results[0].geometry.location.lat,
      //   //       res.data.results[0].geometry.location.lng
      //   //     );
      //   //     this.addMarker(this.map, marker, data);
      //   //     // Todo : 같은 아파트 여러개 거래기록이 있는 경우 마커확인할 수 없음
      //   //   })
      //   //   .catch((err) => {
      //   //     console.error(err);
      //   //   });
      // });
    },

    // 마커를 생성하고 지도위에 표시하는 함수입니다
    addMarker(map, position, data) {
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
        position: position,
        clickable: true, // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(this.map);

      // 생성된 마커를 배열에 추가합니다
      this.markers.push(marker);

      var open = this.openSidebar;
      var select = this.selectInfo;
      kakao.maps.event.addListener(marker, 'click', function() {
        select(data);
        open();
        map.panTo(position);
      });
    },

    // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
    setMarkers(map) {
      for (var i = 0; i < this.markers.length; i++) {
        this.markers[i].setMap(map);
      }
    },

    clearMarkers() {
      this.setMarkers(null);
      this.markers = [];
    },

    openSidebar() {
      this.isSidebarOpen = true;
    },

    selectInfo(data) {
      this.selectedInfo = data;
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
