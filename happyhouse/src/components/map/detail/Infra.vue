<template>
  <b-container>
    <h1>this is infra.vue</h1>
    <h6>{{ getConveniences }}</h6>
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
      this.CONVENIENCE({
        radius: this.radius,
        x: this.lng,
        y: this.lat,
      });
    },
  },
  data() {
    return {
      radius: 100,
    };
  },
  //   beforeUpdate() {
  //     console.log('beforeUpdate:' + this.lat + ',' + this.lng);
  //   },
  //   updated() {
  //     console.log('updated:' + this.lat + ',' + this.lng);
  //   },
  computed: {
    ...mapGetters(['getConveniences']),
  },
  methods: {
    ...mapActions(['CONVENIENCE']),
  },
};
</script>
