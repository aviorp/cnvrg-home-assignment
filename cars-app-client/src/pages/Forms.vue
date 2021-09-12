<template>
  <page-layout>
    <template #title>Options</template>
    <profile-card v-for="(nav, index) in navs" :key="index" nav>
      <template #image>
        <img class="nav-image" :src="require(`@/assets/${nav.img}`)" alt="" />
      </template>
      <template #title>{{ nav.title }} </template>
      <template #action-buttons>
        <button class="card-button" @click="$router.replace(nav.route)">
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
        title: "Create Car",
        route: {
          name: "SelectedForm",
          params: {
            type: "Car",
          },
        },
        img: "forms.svg",
      },
      {
        title: "Create Driver",
        route: {
          name: "SelectedForm",
          params: {
            type: "Driver",
          },
        },
        img: "forms.svg",
      },

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
