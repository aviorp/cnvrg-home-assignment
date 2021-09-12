<template>
  <div class="page-container">
    <h1>
      <slot name="title"></slot>
    </h1>
    <div class="page-content space-bottom">
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  name: "PageLayout",
};
</script>

<style lang="scss" scoped>
@import "@/styles/_devices.scss";
.page-container {
  padding: 2rem;
  min-width: 370px;
}
.page-content {
  padding: 1.5rem;
  height: 100%;
  width: 100%;
  gap: 16px;
  align-items: center;
  justify-content: center;
  display: flex;
  flex-wrap: wrap;

  @media #{$break1} {
    flex-direction: column;
    align-items: center;
    flex-wrap: nowrap;
  }
}
h1 {
  display: block;
}
</style>
