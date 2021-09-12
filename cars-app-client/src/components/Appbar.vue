<template>
  <header class="header disable-select">
    <arrow-left-icon
      size="1.5x"
      class="cursor-pointer"
      v-if="$route.name !== 'Home'"
      @click="$router.go(-1)"
    ></arrow-left-icon>
    <menu-icon
      size="1.5x"
      @click="$emit('toggle-sidebar', !sidebar)"
      class="cursor-pointer"
    ></menu-icon>
    <h1>Cars App</h1>
  </header>
</template>

<script>
import { MenuIcon } from "vue-feather-icons";
import { ArrowLeftIcon } from "vue-feather-icons";
export default {
  name: "Appbar",
  components: {
    MenuIcon,
    ArrowLeftIcon,
  },
  props: {
    sidebar: {
      type: Boolean,
      required: true,
    },
  },
};
</script>

<style lang="scss" scoped>
.header {
  display: flex;
  align-items: center;
  padding: 0.25rem 0.75rem;
  background-color: #252b3f;
  color: #fff;
  box-shadow: 0px 2px 3px #b9b9b9;
  gap: 14px;
  width: 100%;
  position: sticky;
  top: 0;
  h1 {
    font-weight: 400;
    font-size: 1.8rem;
  }
}
</style>
