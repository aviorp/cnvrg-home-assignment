<template>
  <page-layout class="space-bottom space-left container column">
    <template #title>Drivers And Cars</template>
    <header>
      <p>Select Driver or Car to See all the relevant Attachments.</p>
    </header>
    <main class="column main-content">
      <div class="row gap">
        <select
          placeholder="Select Driver"
          class="form-input"
          v-model="driver"
          :disabled="car !== ''"
        >
          <option
            v-for="(driver, index) in drivers"
            :key="index"
            :value="driver"
            >{{ driver.name }}
          </option>
        </select>
        <x-icon
          size="1.5x"
          class="icon"
          v-if="driver"
          @click="
            driver = '';
            submit = false;
          "
        ></x-icon>
      </div>
      <div class="row gap">
        <select
          placeholder="Select Car"
          class="form-input"
          v-model="car"
          :disabled="driver !== ''"
        >
          <option v-for="(car, index) in cars" :key="index" :value="car">
            {{ car.name }}
          </option>
        </select>
        <x-icon
          size="1.5x"
          class="icon"
          v-if="car"
          @click="
            car = '';
            submit = false;
          "
        ></x-icon>
      </div>

      <button class="form-button" @click="submit = true">Submit</button>
    </main>

    <section-layout v-if="(car && submit) || (driver && submit)">
      <template #title
        >Results For {{ driver !== "" ? driver.name : car.name }}</template
      >
      <ul v-if="driver">
        <p>Cars</p>
        <li
          v-for="(car, index) in driver.cars"
          :key="index"
          class="row items-center gap"
        >
          <img :src="car.img" alt="" class="profile-image" />
          <span
            >{{ car.name }} <span> Created At {{ car.created_at }}</span></span
          >
        </li>
      </ul>
      <ul v-else>
        <p>Drivers</p>
        <li
          v-for="(driver, index) in car.drivers"
          :key="index"
          class="row items-center gap"
        >
          <img src="@/assets/driver.svg" alt="" class="profile-image" />
          <span
            >{{ driver.name }}
            <span> Created At {{ driver.created_at }}</span></span
          >
        </li>
      </ul>
    </section-layout>
  </page-layout>
</template>

<script>
import PageLayout from "../layouts/PageLayout.vue";
import SectionLayout from "../layouts/SectionLayout.vue";
import { XIcon } from "vue-feather-icons";
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
      driver: "",
      car: "",
      submit: false,
    };
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
