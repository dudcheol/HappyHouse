<template>
  <b-container class="p-0">
    <h1 class="font-weight-bold pt-3">{{ infos[0].aptName }}</h1>
    <p class="text-right pr-4">
      <b-badge variant="info">아파트 매매</b-badge>
      {{ infos[0].dealYear }}.{{ infos[0].dealMonth }}.{{ infos[0].dealDay }}
    </p>
    <b-tabs content-class="mt-3">
      <b-tab title="최근거래" active
        ><RecentDeal
          :deal="deal | price"
          :item="recentlyItem"
          :compare="compare"
          :compareString="Math.abs(compare) | price"
        ></RecentDeal
      ></b-tab>
      <b-tab>
        <template #title>모든거래({{ infos.length }})</template>
        <DetailDeal
          :items="items"
          :avg="avg | price"
          :cnt="infos.length"
        ></DetailDeal>
      </b-tab>
      <b-tab title="인프라"
        ><Infra :lat="selectedInfo.lat" :lng="selectedInfo.lng"></Infra
      ></b-tab>
      <b-tab title="리뷰"><Review></Review></b-tab>
    </b-tabs>
  </b-container>
</template>

<script>
import Review from './detail/Review.vue';
import Infra from './detail/Infra.vue';
import RecentDeal from './detail/RecentDeal.vue';
import DetailDeal from './detail/DetailDeal.vue';
import { mapGetters, mapActions } from 'vuex';

export default {
  components: { Review, Infra, RecentDeal, DetailDeal },

  props: {
    selectedInfo: Object,
  },

  computed: {
    ...mapGetters(['getSelectedInfosByLatlng']),
  },

  watch: {
    selectedInfo: function(val) {
      this.SEARCHBYLATLNG({
        lat: val.lat,
        lng: val.lng,
      });
    },
    getSelectedInfosByLatlng: function(val) {
      this.update(val);
    },
  },

  data() {
    return {
      infos: [{}],
      items: [
        {
          실거래가: '-',
          층: '-',
        },
      ],
      recentlyItem: [
        {
          층: '-',
          법정동: '-',
          지번: '-',
          건축연도: '-',
          환경정보: '-',
          상권정보: '-',
        },
      ],
      deal: 0,
      avg: 0,
      compare: 0,
    };
  },

  methods: {
    ...mapActions(['SEARCHBYLATLNG']),

    update(infos) {
      this.deal = infos[0].dealAmount;
      this.infos = infos;
      this.items = [];
      this.recentlyItem = [
        {
          층: infos[0].floor,
          법정동: infos[0].dong,
          지번: infos[0].jibun,
          건축연도: infos[0].buildYear,
          환경정보: '-',
          상권정보: '-',
        },
      ];
      var sum = 0;
      for (let i = 0; i < this.infos.length; i++) {
        sum = sum + parseInt(this.infos[i].dealAmount.replace(',', ''));
        this.items.push({
          거래날짜:
            infos[i].dealYear +
            '-' +
            infos[i].dealMonth +
            '-' +
            infos[i].dealDay,
          실거래가: this.$options.filters.price(infos[i].dealAmount),
          층: infos[i].floor,
        });
      }
      this.avg = Math.round(sum / this.infos.length);
      this.compare =
        this.avg - parseInt(this.infos[0].dealAmount.replace(',', ''));
    },
  },

  filters: {
    price(value) {
      if (!value) return value;
      value = value + '';
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
