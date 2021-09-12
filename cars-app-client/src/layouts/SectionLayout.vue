<template>
  <div class="section-container space-bottom">
    <p class="section-title">
      <slot name="title"></slot>
    </p>
    <section class="section-content">
      <slot></slot>
    </section>
  </div>
</template>

<script>
export default {
  name: "SectionLayout",
};
</script>

<style lang="scss" scoped>
.section-container {
  width: 100%;
}
.section-content {
  border: 1.5px solid #eee;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);

  background-color: #fff;
  padding: 0.75rem;
}

p {
  font-size: 1.6rem;
}
</style>
