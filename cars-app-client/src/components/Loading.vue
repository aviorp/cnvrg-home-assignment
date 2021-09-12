<template>
  <div class="overlay">
    <img src="@/assets/loader.svg" alt="" />
  </div>
</template>

<script>
export default {
  name: "Loading",
};
</script>

<style lang="scss" scoped>
.overlay {
  height: 100%;
  width: 100%;
  position: absolute;
  z-index: 999;
  background-color: rgba(66, 66, 66, 0.3);
  top: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
