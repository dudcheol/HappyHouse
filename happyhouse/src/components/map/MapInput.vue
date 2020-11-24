<template>
  <b-container
    id="search-box"
    class="m-2 p-1 position-absolute border border-light rounded shadow"
  >
    <b-row class="pl-1 pt-1 pb-1 mx-auto">
      <b-col cols="10" class="px-0">
        <b-form-input
          id="search-input"
          type="search"
          class="form-control form-control"
          placeholder="검색하고 싶은 장소를 입력하세요"
          @keyup="searchQuery"
          @keyup.enter="searchEnter"
          v-model="query"
          @focus="inputFocus"
        ></b-form-input>
      </b-col>
      <b-col cols="2" class="px-0">
        <b-button id="search-apt" variant="primary" @click="searchEnter">
          검색
        </b-button>
      </b-col>
    </b-row>
    <b-container class="px-1 pb-1 mt-1">
      <b-list-group horizontal style="height:30px">
        <b-list-group-item class="py-1 px-3 font-weight-bold" variant=""
          >매매</b-list-group-item
        >
        <b-list-group-item class="flex-fill py-1" style="font-size:15px">{{
          rangeDeal == 20 ? '검색 조건을 설정해주세요' : `${rangeDeal}억원 이하`
        }}</b-list-group-item>
        <b-list-group-item
          class="py-1 pr-4 pl-3 ml-auto"
          button
          variant="primary"
          style="width:20px"
          v-b-toggle="'collapse-filter'"
          ><b-icon-sliders></b-icon-sliders
        ></b-list-group-item>
      </b-list-group>
      <b-collapse id="collapse-filter" class="mt-2">
        <b-card no-body>
          <b-list-group flush>
            <b-list-group-item
              ><b-row align-v="center" class="px-1">
                <span class="font-weight-bold" style="font-size:20px"
                  >필터</span
                >
                <b-button
                  size="sm"
                  variant="light"
                  class="ml-auto"
                  @click="initRange"
                  >초기화</b-button
                ></b-row
              ></b-list-group-item
            >
            <b-list-group-item>
              <b-row>가격</b-row>
              <b-row
                class="text-info font-weight-bold"
                style="font-size:25px"
                >{{ rangeDeal == 20 ? '전체' : `${rangeDeal}억원 이하` }}</b-row
              >
              <b-row class="pt-2">
                <b-form-input
                  id="range-deal"
                  v-model="rangeDeal"
                  type="range"
                  min="1"
                  max="20"
                  step="0.5"
                  @mouseup="modifyFilter"
                ></b-form-input></b-row
            ></b-list-group-item>
            <!-- <b-list-group-item
              ><b-row>인프라 지수</b-row>
              <b-row
                class="text-info font-weight-bold"
                style="font-size:25px"
                >{{ rangeInfra == 0 ? '전체' : `${rangeInfra}점 이상` }}</b-row
              >
              <b-row class="pt-2">
                <b-form-input
                  id="range-infra"
                  v-model="rangeInfra"
                  type="range"
                  min="0"
                  max="5"
                  step="0.5"
                  @mouseup="modifyFilter"
                ></b-form-input></b-row
            ></b-list-group-item> -->
          </b-list-group>
        </b-card>
      </b-collapse>
    </b-container>
    <b-container id="search-result" class="p-1" v-show="resultVisible">
      <b-list-group>
        <b-list-group-item v-if="resultSearch == ''">
          <b-row class="px-2 pb-1" align-h="center"
            ><b-icon-emoji-expressionless></b-icon-emoji-expressionless
          ></b-row>
          <b-row class="px-2" style="font-size:12px" align-h="center">
            검색 결과가 없습니다.
          </b-row>
        </b-list-group-item>
        <b-list-group-item
          v-show="resultSearch"
          v-for="(item, index) in resultSearch.data"
          :key="index"
          button
          @click="resultClick(item)"
        >
          <b-row class="px-2">{{ item.place_name }}</b-row>
          <b-row class="px-2" style="color:grey; font-size:12px">{{
            item.address_name
          }}</b-row>
        </b-list-group-item>
      </b-list-group>
    </b-container>
  </b-container>
</template>

<script>
export default {
  props: {
    resultSearch: Object,
    resultVisible: Boolean,
  },
  data() {
    return {
      query: '',
      rangeDeal: 20,
      rangeInfra: 0,
    };
  },
  // watch: {
  //   rangeDeal: function() {
  //     this.modifyFilter(this.rangeDeal, this.rangeInfra);
  //   },
  //   rangeInfra: function() {
  //     this.modifyFilter(this.rangeDeal, this.rangeInfra);
  //   },
  // },
  methods: {
    searchQuery() {
      if (this.query == '') {
        this.resultSearch = '';
      }
      this.$emit('result-visible', true);
      this.$emit('search-query', this.query);
    },
    resultClick(position) {
      console.log('click!!!');
      this.query = position.place_name;
      this.$emit('result-click', {
        lat: position.y,
        lng: position.x,
      });
    },
    searchEnter() {
      if (this.resultSearch == '') return;
      this.$emit('result-click', {
        lat: this.resultSearch.data[0].y,
        lng: this.resultSearch.data[0].x,
      });
    },
    inputFocus() {
      this.$emit('result-visible', true);
      this.query = '';
    },
    inputBlur() {
      this.$emit('result-visible', false);
    },
    initRange() {
      this.rangeDeal = 20;
      this.rangeInfra = 0;
      this.modifyFilter();
    },
    modifyFilter() {
      this.$emit('modify-filter', {
        deal: this.rangeDeal,
        infra: this.rangeInfra,
      });
    },
  },
};
</script>

<style scoped>
#search-box {
  z-index: 1000;
  max-width: 370px;
  background: white;
}
#search-result {
  max-height: 300px;
  overflow: auto;
}
</style>
