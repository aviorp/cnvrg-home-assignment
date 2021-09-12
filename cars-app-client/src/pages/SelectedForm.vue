<template>
  <page-layout class="space-bottom  selected-item-container">
    <template #title>Create {{ type }}</template>
    <form>
      <div v-if="type === TYPES.driver">
        <input
          type="text"
          placeholder="Insert Driver name..."
          class="form-input"
          v-model="driverName"
        />
        <input
          type="text"
          placeholder="Insert Driver Email..."
          class="form-input"
          v-model="driverEmail"
        />
      </div>
      <div class="row gap" v-else>
        <input
          type="text"
          placeholder="Insert Car name..."
          v-model="carName"
          class="form-input"
        />
        <input type="color" id="color" v-model="carColor" />
      </div>
      <select
        type="text"
        placeholder="Select Car Type..."
        v-model="carType"
        class="form-input"
        v-if="type === TYPES.car"
      >
        <option v-for="(option, index) in options" :value="option" :key="index">
          {{ option }}</option
        >
      </select>
      <div class="column  text-center" v-if="type === TYPES.car">
        <label for="file" class="file-button column  items-center">
          <input
            type="file"
            id="file"
            placeholder="Insert Car image..."
            @change="onFileChange($event)"
          />
          <span>Choose File For upload</span>
        </label>
        <span v-if="carImg" class="selected-file"
          >Selected File : {{ carImg.name }}</span
        >
      </div>
      <button class="form-button" @click.prevent="onSendForm">
        Create {{ type }}
      </button>
    </form>
  </page-layout>
</template>

<script>
import PageLayout from "../layouts/PageLayout.vue";
import SectionLayout from "../layouts/SectionLayout.vue";
import { TYPES, toBase64 } from "@/utils";
import { createCar, createDriver } from "@/api";

export default {
  components: { PageLayout, SectionLayout },
  name: "SelectedForm",
  data: () => ({
    TYPES,
    driverName: "",
    driverEmail: "",
    carName: "",
    carImg: "",
    carColor: "",
    carType: "",
    options: ["SUV", "Family", "Sports", "Luxury", "Mini"],
  }),
  methods: {
    async onFileChange(e) {
      this.carImg = {
        name: e.target.files[0].name,
        data: await toBase64(e.target.files[0]),
      };
    },
    async onSendForm() {
      try {
        this.$emit("toggle-loading", true);
        if (this.type === this.TYPES.car) {
          const newCar = await createCar({
            img: this.carImg.data,
            name: this.carName,
            carType: this.carType,
            color: this.carColor,
          });
          this.$emit("refresh-items");
          await this.$awn.success("Car Created Successfully.");
          await this.$router.push({
            name: "SelectedCar",
            params: { id: newCar.id },
          });
        } else {
          const newDriver = await createDriver({
            name: this.driverName,
            email: this.driverEmail,
          });
          this.$emit("refresh-items");
          await this.$awn.success("Driver Created Successfully.");
          await this.$router.push({
            name: "SelectedDriver",
            params: { id: newDriver.id },
          });
        }
      } catch (error) {
        console.error(error);
      }
    },
  },
  computed: {
    type() {
      return this.$route.params.type;
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

  .selected-file {
    margin-top: 0.5rem;
  }
}
</style>
