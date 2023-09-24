<template>
  <div>
    <button @click="toggle" v-for="name in Object.keys(sections)" :key="name">
      {{ name }}
    </button>
  </div>
</template>

<script>
import { clicked, sections } from "../../stores/dragZone.js";

export default {
  setup() {
    function toggle(event) {
      clicked.value = event.target.innerText;
    }
    return { sections, toggle };
  },
};
</script>

<style>
</style>