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
    <map-input
      @search-query="searchQuery"
      @result-click="moveMapToPosition"
      @result-visible="changeResultVisible"
      :resultSearch="resultSearch"
      :resultVisible="resultVisible"
    ></map-input>
    <div id="map" class="map"></div>
  </div>
</template>

<script>
import MapInput from '@/components/map/MapInput.vue';
import InfoDetail from '@/components/map/InfoDetail.vue';
import { mapGetters, mapActions } from 'vuex';

const MAP_APP_KEY = process.env.VUE_APP_MAP_APP_KEY;
// const GMAP_APP_KEY = process.env.VUE_APP_GMAP_APP_KEY;

export default {
  components: { MapInput, InfoDetail },
  data() {
    return {
      map: null,
      markers: [],
      clusterer: null,
      ps: null,
      isSidebarOpen: false,
      resultVisible: false,
      selectedInfo: {},
      resultSearch: [],
    };
  },

  mounted() {
    window.kakao && window.kakao.maps ? this.initMap() : this.addMapScript();
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
    ...mapActions(['HOUSEINFO', 'MOVEMAP']),

    addMapScript() {
      const script = document.createElement('script');
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=' +
        MAP_APP_KEY +
        '&libraries=services,clusterer';
      document.head.appendChild(script);
    },

    initMap() {
      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      var options = {
        //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(37.5665734, 126.978179), //지도의 중심좌표.
        level: 4, //지도의 레벨(확대, 축소 정도)
        maxLevel: 7,
      };

      this.map = new kakao.maps.Map(container, options); //지도 생성 및 객체

      var mapTypeControl = new kakao.maps.MapTypeControl();
      this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      var zoomControl = new kakao.maps.ZoomControl();
      this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      // 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
      kakao.maps.event.addListener(this.map, 'tilesloaded', this.moveMap);
      kakao.maps.event.addListener(this.map, 'click', this.clickMap);

      this.clusterer = new kakao.maps.MarkerClusterer({
        map: this.map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 5, // 클러스터 할 최소 지도 레벨
      });

      this.ps = new kakao.maps.services.Places();
    },

    searchQuery(query) {
      // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
      this.ps.keywordSearch(query, this.placesSearchCB);
    },

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    placesSearchCB(data, status, pagination) {
      if (status === kakao.maps.services.Status.OK) {
        // mapinput에 보내기
        this.resultSearch = {
          data,
          pagination,
        };
      } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        this.resultSearch = '';
        return;
      } else if (status === kakao.maps.services.Status.ERROR) {
        alert('검색 결과 중 오류가 발생했습니다.');
        return;
      }
    },

    moveMap() {
      // 지도 영역정보를 얻어옵니다
      var bounds = this.map.getBounds();
      // 영역정보의 남서쪽 정보를 얻어옵니다
      var swLatlng = bounds.getSouthWest();
      // 영역정보의 북동쪽 정보를 얻어옵니다
      var neLatlng = bounds.getNorthEast();

      this.MOVEMAP({
        swlat: swLatlng.Ma,
        swlng: swLatlng.La,
        nelat: neLatlng.Ma,
        nelng: neLatlng.La,
      });
    },

    moveMapToPosition(position) {
      this.resultVisible = false;
      this.map.panTo(new kakao.maps.LatLng(position.lat, position.lng));
      this.moveMap();
    },

    updateMap(houseinfos) {
      this.clearMarkers(null);
      this.clusterer.clear();
      var level = this.map.getLevel();
      console.log(this.map.getLevel());

      if (level > 5) {
        return;
      }

      if (level > 4) {
        for (let i = 0; i < houseinfos.length; i++) {
          this.markers.push(
            new kakao.maps.Marker({
              position: new kakao.maps.LatLng(
                houseinfos[i].lat,
                houseinfos[i].lng
              ),
              clickable: true,
            })
          );
        }
        this.clusterer.addMarkers(this.markers);
        return;
      }

      for (let i = 0; i < houseinfos.length; i++) {
        const position = new kakao.maps.LatLng(
          houseinfos[i].lat,
          houseinfos[i].lng
        );
        this.addMarker(this.map, position, houseinfos[i]);
      }
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

    clickMap() {
      this.isSidebarOpen = false;
      this.resultVisible = false;
    },

    changeResultVisible(bool) {
      this.resultVisible = bool;
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
