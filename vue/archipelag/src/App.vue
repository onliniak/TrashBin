<template>
  <aside ref="dragZone">
    <display-section />
  </aside>
  <main ref="dropZone"></main>
  <aside>
    <input-section />
    <extra-section />
  </aside>
  <buttons-drag-zone class="aside" />
</template>

<script>
import ButtonsDragZone from "./components/dragZone/Buttons.vue";
import DisplaySection from "./components/dragZone/Components.vue";

import { newSection, addComponent } from "./stores/dragZone.js";
import {
  areChildrenKnew,
  dropCurrentIndex,
  Currentindex,
  pushChildren,
  swapChildrens,
  dropTagName,
} from "./stores/dropZone.js";

import { onMounted, ref } from "vue";
import dragula from "dragula";
import InputSection from "./components/dropZone/inputSection.vue";
import ExtraSection from "./components/dropZone/extraSection.vue";

newSection("core");
addComponent("core", "<p>Typowy Text</p>");
addComponent(
  "core",
  '<img src="https://via.placeholder.com/150" loading="lazy" />'
);
newSection("template");
addComponent(
  "template",
  "<archipelag-table>Tabela</archipelag-table>"
);
addComponent(
  "template",
  "<archipelag-city><div>Miasto</div><div>Miasto</div><div>Miasto</div></archipelag-city>"
);
// newSection("database");
// addComponent(
//   "database",
//   "<archipelag-monster>Dodaj potwory</archipelag-monster>"
// );
// addComponent("database", "<archipelag-item>Dodaj przedmioty</archipelag-item>");
// addComponent("database", "<archipelag-klasa>Dodaj klasę</archipelag-klasa>");
// addComponent("database", "<archipelag-rasa>Dodaj rasę</archipelag-rasa>");
// addComponent(
//   "database",
//   "<archipelag-event>Dodaj losowe wydarzenie</archipelag-event>"
// );

export default {
  name: "App",
  components: {
    ButtonsDragZone,
    DisplaySection,
    InputSection,
    ExtraSection,
  },
  setup() {
    // https://codesandbox.io/s/uwgri?file=/src/App.vue:0-904
    // https://stackoverflow.com/questions/66884103/why-cant-i-use-dragula-in-vue3-setup-but-mounted
    const dragZone = ref(null);
    const dropZone = ref(null);

    onMounted(() => {
      dragula([dragZone.value, dropZone.value], {
        removeOnSpill: true,
        copy: function (el, source) {
          return source === dragZone.value;
        },
        accepts: function (el, target) {
          return target !== dragZone.value;
        },
      })
        .on("cloned", function (el) {
          el.addEventListener("dblclick", function () {
            dropTagName.value = el.children[0].tagName;
            document
              .querySelectorAll(".activElement")
              .forEach((e) => e.classList.remove("activElement"));
            el.children[0].classList.toggle("activElement");
          });
        })
        .on("drop", function (element) {
          const index = Currentindex(element);
          areChildrenKnew(index)
            ? swapChildrens(dropCurrentIndex.value, index)
            : pushChildren(element);
        })
        .on("drag", function (element) {
          if (element.parentNode.nodeName === "MAIN") {
            dropCurrentIndex.value = Currentindex(element);
          }
        });
    });
    return { dragZone, dropZone };
  },
};
</script>

<style>
@import "https://cdn.jsdelivr.net/npm/dragula@3.7.3/dist/dragula.min.css";
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;

  display: flex;
  flex-wrap: wrap;
}
#app > aside {
  flex: 1 1 22.5%;
  height: 55vh;
  display: flex;
  flex-direction: column;
  overflow: auto;
}
#app > main {
  flex: 2.44 2.44 55%;
  overflow: auto;
}

city {
  display: block;
  columns: 3;
  margin: auto;
  max-width: max-content;
}

@media only screen and (min-width: 1024px) {
  .aside {
    width: 22.5%;
  }
  .aside > button {
    width: 75%;
  }
}
@media only screen and (max-width: 1024px) {
  #app {
    flex-direction: column;
  }
}
</style>
