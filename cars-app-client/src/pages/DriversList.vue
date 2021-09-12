<template>
  <page-layout>
    <template #title>Drivers</template>

    <profile-card
      v-for="driver in drivers"
      :key="driver.id"
      :counter="driver.cars.length"
      isDriver
    >
      <template #image>
        <img class="profile-image" src="@/assets/driver.svg" />
      </template>
      <template #title>{{ driver.name }} </template>
      <template #action-buttons>
        <button
          class="card-button"
          @click="
            $router.push({
              name: 'SelectedDriver',
              params: {
                id: driver.id,
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
  name: "DriversList",
  components: {
    ProfileCard,
    PageLayout,
  },
  props: {
    drivers: {
      type: Array,
    },
  },
};
</script>
