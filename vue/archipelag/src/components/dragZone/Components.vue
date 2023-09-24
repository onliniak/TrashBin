<template>
  <empty-elemento
    style="padding: 0.75em 0;"
    v-for="component in activeSection"
    :key="component"
    v-html="component"
  ></empty-elemento>
</template>

<script>
import { computed } from "@vue/runtime-core";
import { clicked, sections } from "../../stores/dragZone.js";

export default {
  setup() {
    const activeSection = computed((e = clicked.value) => {
      if (e != "") {
        return sections.value[clicked.value].components;
      }
    });
    return { activeSection };
  },
};
</script>
