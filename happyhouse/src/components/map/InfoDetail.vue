<template>
  <b-container class="p-0">
    <h1 class="font-weight-bold pt-3">{{ selectedInfo.aptName }}</h1>
    <p class="text-right pr-4">
      <b-badge variant="info">아파트 매매</b-badge>
      {{ selectedInfo.dealYear }}.{{ selectedInfo.dealMonth }}.{{
        selectedInfo.dealDay
      }}
    </p>
    <b-tabs content-class="mt-3">
      <b-tab title="거래정보" active>
        <b-container class="px-3 py-2">
          <b-card
            border-variant="info"
            header="실거래가"
            align="center"
            class="mb-4"
          >
            <b-card-text class="font-weight-bolder"
              ><h3>
                {{ selectedInfo.dealAmount | price }}
              </h3>
            </b-card-text>
          </b-card>
          <b-table :items="items" stacked></b-table>
        </b-container>
      </b-tab>
      <b-tab title="리뷰"><p>I'm the second tab</p></b-tab>
      <!-- <b-tab title="Disabled" disabled><p>I'm a disabled tab!</p></b-tab> -->
    </b-tabs>
  </b-container>
</template>

<script>
export default {
  props: {
    selectedInfo: Object,
  },
  data() {
    return {
      items: [
        {
          층: '-',
          법정동: '-',
          지번: '-',
          건축연도: '-',
          환경정보: '-',
          상권정보: '-',
        },
      ],
    };
  },
  beforeUpdate() {
    this.items[0].층 = this.selectedInfo.floor;
    this.items[0].법정동 = this.selectedInfo.dong;
    this.items[0].지번 = this.selectedInfo.jibun;
    this.items[0].건축연도 = this.selectedInfo.buildYear;
    this.items[0].환경정보 = '-';
    this.items[0].상권정보 = '-';
  },
  filters: {
    price(value) {
      if (!value) return value;
      return (
        value
          .replace(',', '')
          .toString()
          .replace(/\B(?=(\d{4})+(?!\d))/g, '억') + '만원'
      ).replace('0000만원', '원');
    },
  },
};
</script>
