<template>
  <b-container>
    <b-card
      title="Card Title"
      sub-title="Sub Title"
      class="text-left"
      role="dialog"
    >
      <b-card-text
        ><span>만족도</span> <span><strong>4.5</strong></span>
        <span> 2020/11/23</span></b-card-text
      >
      <b-card-text>
        Some quick example text to build on the card title and make up the bulk
        of the card's content.
      </b-card-text>
      <b-overlay
        :show="show"
        variant="transparent"
        opacity="1"
        blur="5px"
        no-wrap
      >
        <template #overlay>
          <b-card class="text-center p-0" style="max-width:10rem" size="sm">
            <h3><b-icon-lock></b-icon-lock></h3>
            <h6>나의 리뷰를 작성하면 모든 리뷰를 볼 수 있습니다</h6>
            <b-button variant="outline-info">리뷰 작성하기</b-button>
          </b-card>
        </template>
      </b-overlay>
    </b-card>
  </b-container>
</template>

<script>
export default {
  data() {
    return {
      show: false,
    };
  },
};
</script>
