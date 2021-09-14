<template>
  <page-layout class=" space-left container column">
    <template #title>Drivers And Cars Attachments</template>
    <header>
      <p>Select Drivers / Cars to Attach them together.</p>
    </header>
    <main class="column main-content">
      <treeselect
        v-model="selectedCars"
        multiple
        :options="cars"
        placeholder="Select Cars"
        :normalizer="normalizer"
      />
      <treeselect
        v-model="selectedDrivers"
        multiple
        :options="drivers"
        placeholder="Select Drivers"
        :normalizer="normalizer"
      />
      <button class="form-button" @click="onAttachItems">Submit</button>
    </main>
  </page-layout>
</template>

<script>
import PageLayout from "../layouts/PageLayout.vue";
import SectionLayout from "../layouts/SectionLayout.vue";
import { XIcon } from "vue-feather-icons";
import { normalizer } from "@/utils";
import { attachDriversAndCars } from "@/core/api";
export default {
  components: { PageLayout, SectionLayout, XIcon },
  name: "SelectedItem",
  props: {
    cars: {
      type: Array,
      required: true,
    },
    drivers: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      selectedCars: [],
      selectedDrivers: [],
      carsOptions: [],
      driversOptions: [],
    };
  },
  methods: {
    normalizer,
    async onAttachItems() {
      this.$emit("toggle-loading", true);
      try {
        await attachDriversAndCars({
          driver_id: this.selectedDrivers,
          car_id: this.selectedCars,
        });
        this.$emit("refresh-items");
        await this.$awn.success("Cars and drivers attached successfully.");
        await this.$router.push({
          name: "Home",
        });
      } catch (error) {
        this.$emit("toggle-loading", false);
        console.error(error);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.container {
  background-color: #fff;
  width: 50%;
  margin: 0 auto;
  margin-top: 5%;
  border: 1.5px solid #eee;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);

  header {
    justify-content: space-between;
    width: 80%;
    text-align: center;
    p {
      padding: 20px;
    }
    gap: 10px;
    &::after {
      content: "";
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      align-self: center;
      height: 1px;
      width: 50%;
      margin-left: 25%;
      background-color: #ececec;
    }
  }
  h1 {
    font-weight: 400;
    font-size: 1.6rem;
    color: #3c495a;
  }
}
.driver-details {
  font-size: 16px;
}
.main-content {
  width: 100%;
}

.icon {
  margin-top: 2%;
  cursor: pointer;
}
</style>
