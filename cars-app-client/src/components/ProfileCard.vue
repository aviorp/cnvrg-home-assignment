<template>
  <div class="card">
    <header >
      <slot name="image"></slot>
      <h1>
        <slot name="title"></slot>
      </h1>
    </header>

    <ul style="text-align:left;padding:1rem" v-if="!nav">
      <p>
        {{ isDriver ? "Vehicles owned" : "Drivers" }} :
        <span>({{ counter }})</span>
      </p>
    </ul>
    <footer>
      <slot name="action-buttons"></slot>
    </footer>
  </div>
</template>

<script>
export default {
  name: "ProfileCard",
  props: {
    isDriver: {
      type: Boolean,
      default: false,
    },
    nav: {
      type: Boolean,
      default: false,
    },
    counter: {
      type: Number,
      default: 0,
    },
  },
};
</script>

<style lang="scss" scoped>
@import "@/styles/_devices.scss";
.card {
  background-color: #fff;
  height: 100%;
  min-width: 300px;
  width: 25%;
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  text-align: center;
  align-items: center;
  color: #3c495a;
  border: 2.5px solid #bbdefb;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);

  &:hover {
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  }
  h1 {
    font-weight: 400;
    font-size: 1.6rem;
  }

  @media #{$break2} {
    width: 45%;
  }
  @media #{$break1} {
    width: 90%;
  }
}

.card-button {
  background-color: #fff;
  color: #3c495a;
  border: none;
  padding: 0.5rem 1rem;
  width: 100%;
  height: 50px;
  box-shadow: 0px 3px 4px #eee;
  transition: background-color 0.5s ease-in-out;
  font-size: 1rem;
  font-family: "Assistant" sans-serif;
  &:hover {
    background-color: #55a8fd;
    color: #fff;
    cursor: pointer;
  }

}

header {
  display: flex;
  flex-direction: column;
  align-items: center;
 &::after {
   content: '';
   display: flex;
   align-items: center;
   justify-content: center;
   text-align: center;
   height: 1px;
   width: 75%;
   background-color: #ececec;
  }
}
</style>
