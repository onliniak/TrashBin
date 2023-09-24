<template>
  <input type="file" @change="readFile" />
</template>

<script>
export default {
  setup() {
    function readFile(e) {
      const file = e.target.files[0];

      let reader = new FileReader();
      reader.onload = (event) => {
        console.log(event.target.result);
      };
      reader.readAsText(file);
    }
    return { readFile };
  },
};
</script>