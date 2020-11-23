<template>
  <b-container class="px-3 py-2">
    <b-card
      border-variant="secondary"
      header="평균 실거래가"
      align="center"
      class="mb-4"
    >
      <b-card-text
        ><h3 class="font-weight-bolder">
          {{ avg }}
        </h3>
      </b-card-text>
    </b-card>
    <h5 class="text-left pl-2 font-weight-bolder">
      <b-icon-card-checklist /> 거래내역 {{ cnt }}건
    </h5>
    <b-table :items="items" stacked></b-table>
  </b-container>
</template>

<script>
export default {
  props: {
    cnt: Number,
    avg: String,
    items: Array,
  },
};
</script>
