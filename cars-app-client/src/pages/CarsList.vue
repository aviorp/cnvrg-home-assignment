<template>
  <page-layout>
    <template #title>Cars</template>

    <profile-card
      v-for="car in cars"
      :key="car.id"
      :counter="car.drivers.length"
    >
      <template #image>
        <img class="profile-image" :src="car.img" alt=""
      /></template>
      <template #title>{{ car.name }} </template>
      <template #action-buttons>
        <button
          class="card-button"
          @click="
            $router.push({
              name: 'SelectedCar',
              params: {
                id: car.id,
              },
            })
          "
        >
          More Info
        </button>
      </template>
    </profile-card>
  </page-layout>
</template>

<script>
import ProfileCard from "@/components/ProfileCard.vue";
import PageLayout from "@/layouts/PageLayout.vue";
export default {
  name: "CarsList",
  components: {
    ProfileCard,
    PageLayout,
  },
  props: {
    cars: {
      type: Array,
    },
  },
};
</script>
