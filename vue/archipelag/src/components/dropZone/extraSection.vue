<template>
  <div v-if="dropTagName === 'P'">
    <file-reader />
  </div>
  <div>
    <button @click="sendJSON">Send</button>
  </div>
</template>

<script>
import { dropList, dropTagName } from "../../stores/dropZone";
import FileReader from "../FileReader.vue";

export default {
  components: { FileReader },
  setup() {
    function sendJSON() {
      const myJSON = [{}];
      const NodeList = dropList.value;
      let i = 0,
        len = NodeList.length;
      while (i < len) {
        switch (NodeList[i].children[0].nodeName) {
          case "P":
            myJSON.push({
              type: "p",
              txt: dropList.value[0].children[0].innerText,
            });
            break;
        }
        i++;
      }
      myJSON.splice(0, 1);
      console.log(JSON.stringify(myJSON));
    }
    return { sendJSON, dropTagName };
  },
};
</script>