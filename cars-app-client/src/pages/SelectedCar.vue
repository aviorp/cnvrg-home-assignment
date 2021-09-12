<template>
  <selected-item :item="car" type="Car"></selected-item>
</template>

<script>
import SelectedItem from "@/components/SelectedItem.vue";
import { getCarById } from "@/api";
export default {
  name: "SelectedCar",
  components: {
    SelectedItem,
  },
  data() {
    return {
      car: null,
    };
  },

  async created() {
    this.car = await getCarById(this.$route.params.id);
  },
};
</script>

