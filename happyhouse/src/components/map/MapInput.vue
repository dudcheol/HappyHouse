<template>
  <b-container id="search-box" class="m-2 position-absolute border border-light rounded shadow">
    <b-row class="p-1">
      <b-col class="px-0">
        <b-form-select
          v-model="sidoSelected"
          :options="sidoOptions"
        ></b-form-select>
      </b-col>
      <b-col class="px-0">
        <b-form-select
          v-model="gugunSelected"
          :options="gugunOptions"
        ></b-form-select>
      </b-col>
      <b-col class="px-0">
        <b-form-select
          v-model="dongSelected"
          :options="dongOptions"
        ></b-form-select>
      </b-col>
    </b-row>
    
    <b-row>
      <b-button-group size="sm">
        <b-button
          v-for="(btn, idx) in buttons"
          :key="idx"
          :pressed.sync="btn.state"
          variant="primary"
          class="text-nowrap"
        >
          {{ btn.caption }}
        </b-button>
      </b-button-group>
    </b-row>

    <b-row class="p-1">
      <b-col cols="10" class="px-0">
        <b-form-input
          id="search-input"
          type="search"
          class="form-control form-control"
          placeholder="아파트 혹은 주택명을 입력하세요"
        ></b-form-input>
      </b-col>
      <b-col cols="2" class="px-0">
        <b-button id="search-apt" variant="secondary">
          검색
        </b-button>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
export default {
  data() {
    return {
      sidoSelected: null,
      gugunSelected: null,
      dongSelected: null,

      sidoOptions: [{ value: null, text: '시도' }],
      gugunOptions: [{ value: null, text: '구군' }],
      dongOptions: [{ value: null, text: '동' }],
      buttons: [
        { caption: '아파트 매매', state: true },
        { caption: '아파트 전월세', state: false },
        { caption: '주택 매매', state: true },
        { caption: '주택 전월세', state: false },
      ],
    };
  },
};
</script>

<style scoped>
#search-box {
  z-index: 1000;
  max-width: 370px;
  background: white;
}
</style>
