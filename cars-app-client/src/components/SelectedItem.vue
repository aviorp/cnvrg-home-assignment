<template>
  <page-layout class="space-bottom  selected-item-container">
    <template #title>Selected {{ type }}</template>
    <header>
      <img
        class="profile-image"
        :src="type === TYPES.car ? item.img : DriverDefault"
      />

      <h1>
        {{ item.name }}&nbsp; &middot;
        <span>{{ type === TYPES.driver ? item.email : item.carType }}</span>
      </h1>
    </header>
    <section-layout
      v-if="
        (type === TYPES.driver && item.cars.length) ||
          (type === TYPES.car && item.drivers.length)
      "
    >
      <template #title>{{
        type === TYPES.car ? "Driver" : "Car Owned"
      }}</template>
      <ul v-if="type === TYPES.driver">
        <li
          v-for="(car, index) in item.cars"
          :key="index"
          class="row items-center space-right"
        >
          <img :src="car.img" alt="" class="profile-image item-image" />
          <span>{{ car.name }} - {{ car.carType }} - {{ car.created_at }}</span>
        </li>
      </ul>
      <ul v-else>
        <li
          v-for="(driver, index) in item.drivers"
          :key="index"
          class="row items-center"
        >
          <img class="profile-image item-image" src="@/assets/driver.svg" />
          <p class="driver-details">
            <span>{{ driver.name }}</span> <span>{{ driver.created_at }}</span>
          </p>
        </li>
      </ul>
    </section-layout>
  </page-layout>
</template>

<script>
import PageLayout from "../layouts/PageLayout.vue";
import SectionLayout from "../layouts/SectionLayout.vue";
import DriverDefault from '@/assets/driver.svg'
import { TYPES } from "@/utils";
export default {
  components: { PageLayout, SectionLayout },
  name: "SelectedItem",
  data() {
    return {
      TYPES,
      DriverDefault
    }
  },
  props: {
    type: {
      type: String,
    },
    item: {
      type: Object,
    },
  },
};
</script>

<style lang="scss" scoped>
.selected-item-container {
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
.item-image {
  margin-right: 16px;
}
</style>
