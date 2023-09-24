<template>
  <div v-if="dropTagName === 'P'">
  A
</div>
<div v-else-if="dropTagName === 'ARCHIPELAG-TABLE'">
  <input type="button" @click="tableGenerate" value="wygeneruj">
</div>
<div v-else-if="dropTagName === 'C'">
  C
</div>
<div v-else>
</div>
</template>

<script>
import { dropTagName } from "../../stores/dropZone.js";
import {ConvertJsonToTable} from '../json-to-table.js'

export default {
  setup() {
    function tableGenerate() {
          var nestedTable = [{
        key1: "val1",
        key2: "val2",
        key3: {
            tableId: "tblIdNested1",
            tableClassName: "clsNested",
            linkText: "Download",
            data: [{
                subkey1: "subval1",
                subkey2: "subval2",
                subkey3: "subval3"
            }]
        }
    }];
      var jsonHtmlTable = ConvertJsonToTable(nestedTable);
      console.log(jsonHtmlTable)
    }
    return { dropTagName, tableGenerate };
  }
};
</script>

<style>
</style>