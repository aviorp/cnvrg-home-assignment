<template>
  <div>
    <Appbar
      @toggle-sidebar="onToggleSidebar($event)"
      :sidebar="sidebar"
    ></Appbar>
    <Sidebar
      :sidebar="sidebar"
      :navs="navs"
      @close-menu="sidebar = false"
    ></Sidebar>
    <Loading v-if="isLoading" />
    <router-view
      :cars="cars"
      :drivers="drivers"
      @refresh-items="initApp"
      @toggle-loading="onToggleLoading($event)"
    ></router-view>
  </div>
</template>

<script>
import Appbar from "@/components/Appbar.vue";
import Sidebar from "@/components/Sidebar.vue";
import Loading from "@/components/Loading.vue";
import { getDrivers, getCars } from "@/core/api";
export default {
  name: "MainLayout",
  components: { Appbar, Sidebar, Loading },
  data: () => ({
    sidebar: false,
    isLoading: false,
    navs: [
      {
        title: "Home Page",
        to: "/",
      },
      {
        title: "Create new car",
        to: {
          name: "SelectedForm",
          params: {
            type: "Car",
          },
        },
      },

      {
        title: "List of cars",
        to: "/cars",
      },
      {
        title: "Create driver",
        to: {
          name: "SelectedForm",
          params: {
            type: "Driver",
          },
        },
      },
      {
        title: "List of Drivers",
        to: "/drivers",
      },
    ],
    cars: [],
    drivers: [],
  }),
  async created() {
    await this.initApp();
  },
  methods: {
    onToggleSidebar(condition) {
      this.sidebar = condition;
    },
    onToggleLoading(condition) {
      this.isLoading = condition;
    },
    async initApp() {
      try {
        this.isLoading = true;
        this.cars = await getCars();
        this.drivers = await getDrivers();
      } catch (error) {
        console.error(error);
        this.isLoading = false;
      } finally {
        this.isLoading = false;
      }
    },
  },
};
</script>
