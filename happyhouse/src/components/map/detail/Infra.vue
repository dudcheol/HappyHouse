<template>
  <b-container>
    <b-row class="px-3 pb-3" align-h="end">
      <b-button @click="allOpen" size="sm" variant="" pill>{{
        openStr
      }}</b-button>
    </b-row>
    <b-card
      no-body
      class="mb-3"
      v-for="(items, index) in getAllCategory"
      :key="index"
    >
      <b-card-header header-tag="header" class="p-1" role="tab">
        <b-button block v-b-toggle="'collapse-' + index" variant="light"
          ><b-row class="px-2" align-v="center">
            <b-col class="text-left p-0">
              <h6 class="mb-0 pl-2 font-weight-bolder text-left">
                <b-icon :icon="icon[index]"></b-icon>
                {{ category[index] }}
              </h6>
            </b-col>
            <b-col class="text-right p-0">
              <b-form-rating
                v-model="items.idx"
                readonly
                no-border
                variant="warning"
                inline
                class="p-0 bg-transparent"
              ></b-form-rating>
            </b-col> </b-row
        ></b-button>
      </b-card-header>
      <b-collapse
        :id="'collapse-' + index"
        :visible="visible[index]"
        role="tabpanel"
      >
        <b-card-body>
          <b-row class="px-2">
            <h6
              v-if="items.length == 0"
              class="p-0 my-1 mx-auto"
              style="color:dimgrey"
            >
              <b-icon-emoji-expressionless></b-icon-emoji-expressionless>
              근처에서 {{ category[index] }}시설을 찾지 못했습니다.
            </h6>
            <h6
              class="p-0 my-1"
              style="color:dimgrey"
              v-for="(item, index) in items"
              :key="index"
            >
              <b-badge variant="light">{{ item.distance }}m</b-badge>거리에
              <b-badge variant="light">{{ item.place_name }}</b-badge
              >이(가) 있어요
            </h6>
          </b-row>
        </b-card-body>
      </b-collapse>
    </b-card>
  </b-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  props: {
    lat: String,
    lng: String,
  },
  watch: {
    lat: function() {
      this.ALLCATEGORY({
        radius: this.radius,
        x: this.lng,
        y: this.lat,
      });
    },
  },
  data() {
    return {
      radius: 500,
      visible: [false, false, false, false, false, false],
      category: ['편의', '교육', '교통', '의료', '카페', '문화'],
      allVisible: false,
      openStr: '모두 펼치기',
      icon: [
        'cart',
        'book',
        'stoplights',
        'clipboard-plus',
        'cup',
        'controller',
      ],
    };
  },
  computed: {
    ...mapGetters([
      'getConveniences',
      'getEducations',
      'getTraffics',
      'getMedicals',
      'getCafes',
      'getCultures',
      'getAllCategory',
    ]),
  },
  methods: {
    ...mapActions([
      'CONVENIENCE',
      'EDUCATION',
      'TRAFFIC',
      'MEDICAL',
      'CAFE',
      'CULTURE',
      'ALLCATEGORY',
    ]),
    allOpen() {
      if (this.allVisible)
        this.visible = [false, false, false, false, false, false];
      else this.visible = [true, true, true, true, true, true];

      this.openStr = this.allVisible ? '모두 펼치기' : '모두 접기';

      this.allVisible = !this.allVisible;
    },
  },
};
</script>
