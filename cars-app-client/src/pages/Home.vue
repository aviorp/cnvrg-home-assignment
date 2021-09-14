<template>
  <page-layout>
    <template #title>Options</template>
    <profile-card v-for="(nav, index) in navs" :key="index" nav>
      <template #image>
        <img class="nav-image" :src="require(`@/assets/${nav.img}`)" alt="" />
      </template>
      <template #title>{{ nav.title }} </template>
      <template #action-buttons>
        <button class="card-button" @click="$router.push(nav.route)">
          Select
        </button>
      </template>
    </profile-card>
  </page-layout>
</template>

<script>
import ProfileCard from "@/components/ProfileCard.vue";
import PageLayout from "@/layouts/PageLayout.vue";
export default {
  name: "Forms",
  components: {
    ProfileCard,
    PageLayout,
  },

  data: () => ({
    navs: [
      {
        title: "Create Car / Driver",
        route: { name: "Forms" },
        img: "forms.svg",
      },
      {
        title: "Drivers List",
        route: { name: "DriversList" },
        img: "people.svg",
      },
      { title: "Cars List", route: { name: "CarsList" }, img: "car.svg" },
      { title: "Drivers & Cars", route: { name: "DriversAndCars" }, img: "together.svg" },
      { title: "Drivers & Cars Attachments", route: { name: "Attachments" }, img: "data_binding.svg" },
    ],
  }),
};
</script>

<style lang="scss">
.nav-image {
  height: 250px;
  padding-top: 40px;
}
</style>
