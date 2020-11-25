<template>
  <b-container>
    <b-container v-if="!getReviews || getReviews.length == 0" class="p-2">
      <b-container class="p-5">
        <h3><b-icon-emoji-expressionless></b-icon-emoji-expressionless></h3>
        등록된 리뷰가 없습니다
      </b-container>
      <b-card class="text-center p-3 mx-5 shadow" size="sm" no-body>
        <h6 class="font-size-15">
          거주 경험을 작성하면<br />모든 리뷰를 볼 수 있습니다
        </h6>
        <b-button
          variant="outline-info"
          size="sm"
          class="mb-1"
          href="/boardForm.bod"
          >리뷰 작성하기</b-button
        >
      </b-card>
    </b-container>
    <b-card
      :title="review.title"
      :sub-title="review.date"
      class="text-left mb-3"
      role="dialog"
      v-for="(review, index) in getReviews"
      :key="index"
    >
      <b-card-text class="m-0"
        ><span class="font-size-15 color-dimgrey"
          >만족도 <strong>4.5</strong>
          <b-form-rating
            v-model="review.star"
            readonly
            no-border
            variant="warning"
            inline
            size="sm"
            class="p-0 bg-transparent"
          ></b-form-rating></span
      ></b-card-text>
      <b-card-text class="font-size-18">
        {{ review.content }}
      </b-card-text>
      <b-overlay
        :show="!auth"
        variant="transparent"
        opacity="1"
        blur="5px"
        no-wrap
      >
        <template #overlay>
          <b-card class="text-center p-3 shadow" size="sm" no-body>
            <h6 class="font-size-15">
              거주 경험을 작성하면<br />모든 리뷰를 볼 수 있습니다
            </h6>
            <b-button
              variant="outline-info"
              size="sm"
              class="mb-1"
              href="/boardForm.bod"
              >리뷰 작성하기</b-button
            >
            <b-button variant="outline-secondary" size="sm" href="/payment"
              >결제하기</b-button
            >
          </b-card>
        </template>
      </b-overlay>
    </b-card>
  </b-container>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';

export default {
  props: {
    info: Object,
  },
  watch: {
    info: function() {
      this.REVIEW({
        lat: this.info.lat,
        lng: this.info.lng,
        aptname: this.info.aptName,
        dongname: this.info.dong,
      });
      this.loginCheck();
    },
    getReviews: function(val) {
      this.$emit('review-count', val.length);
    },
  },
  computed: {
    ...mapGetters(['getReviews']),
  },
  data() {
    return {
      auth: false,
    };
  },
  methods: {
    ...mapActions(['REVIEW']),
    loginCheck() {
      this.auth = localStorage.getItem('auth') == 1 ? true : false;
    },
  },
  // writeReview() {
  //   window.location.href = '/boardForm.bod';
  // },
  // payment() {
  //   window.location.href = '/payment';
  // },
};
</script>

<style scoped>
.font-size-15 {
  font-size: 15px;
}
.font-size-18 {
  font-size: 18px;
}
.color-dimgrey {
  color: dimgray;
}
.color-darkgrey {
  color: darkgray;
}
</style>
