<template>
  <selected-item :item="driver" type="Driver"></selected-item>
</template>

<script>
import SelectedItem from "@/components/SelectedItem.vue";
import { getDriverById } from "@/api";
export default {
  name: "SelectedCar",
  components: {
    SelectedItem,
  },
  data() {
    return {
      driver: null,
    };
  },

  async created() {
    this.driver = await getDriverById(this.$route.params.id);
  },
};
</script>

