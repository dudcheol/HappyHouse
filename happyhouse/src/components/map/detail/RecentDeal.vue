<template>
  <b-container class="px-3 py-2">
    <b-card
      border-variant="info"
      header-bg-variant="info"
      header-border-variant="info"
      header-text-variant="white"
      header="최근 실거래가"
      align="center"
      class="mb-4"
    >
      <b-card-text
        ><h3 class="font-weight-bolder">
          {{ deal }}
        </h3>
        <b-card-text v-if="compare == 0">
          <b-badge variant="light">변동없음</b-badge>
        </b-card-text>
        <b-card-text v-if="compare > 0">
          평균거래가 대비
          <b-badge variant="light">{{ compareString }}</b-badge>
          <b-icon-arrow-down-circle-fill
            variant="warning"
          ></b-icon-arrow-down-circle-fill>
        </b-card-text>
        <b-card-text v-if="compare < 0">
          평균거래가 대비
          <b-badge variant="light">{{ compareString }}</b-badge>
          <b-icon-arrow-up-circle-fill
            variant="success"
          ></b-icon-arrow-up-circle-fill>
        </b-card-text>
      </b-card-text>
    </b-card>
    <h5 class="text-left pl-2 font-weight-bolder">
      <b-icon-info-circle /> 상세정보
    </h5>
    <b-table :items="item" stacked></b-table>
  </b-container>
</template>

<script>
export default {
  props: {
    deal: String,
    item: Array,
    compare: Number,
    compareString: String,
  },
};
</script>
