<template>
  <aside
    class="sidebar-container space-bottom"
    :class="{ 'sidebar-container-closed': !sidebar }"
    @blur="$emit('close-menu')"
  >
    <router-link
      v-for="(nav, index) in navs"
      :key="index"
      :to="nav.to"
      custom
      v-slot="{ navigate }"
    >
      <li @click="navigate" role="link">{{ nav.title }}</li>
    </router-link>
  </aside>
</template>

<script>
export default {
  name: "Sidebar",
  props: {
    navs: {
      type: Array,
      required: true,
      default: [],
    },
    sidebar: {
      type: Boolean,
      required: true,
    },
  },

};
</script>

<style lang="scss" scoped>
.sidebar-container {
  background-color: #252b3f;
  color: #fff;
  max-width: 15%;
  min-width: 250px;
  height: calc(100vh - 50px);
  text-align: center;
  padding: 1rem 0;
  transition: margin 0.5s ease 0.1s;
  position: fixed;
  z-index: 10;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  margin-left: 0px;
  li {
    list-style: none;
    padding: 0.75rem;
    width: 100%;
    &:hover {
      transform: scale(97%);
      background-color: #eee;
      cursor: pointer;
      color: #252b3f;
    }
  }
  &-closed {
    margin-left: -100%;
  }
}
</style>
