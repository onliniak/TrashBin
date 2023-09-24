json = {
  "properties": {
    "txt": {
      "type": "string",
      "minLength": 3,
      "maxLength": 7
    },
    "int": {
      "type": "number",
      "minimum": 3,
      "maximum": 7
    }
  }
};
for (var _i = 0, _a = Object.entries(json.properties); _i < _a.length; _i++) {
  var key = _a[_i][0];
  var parentNode = document.getElementById("app");
  var input = document.createElement("input");

  if (json.properties[key].type === "string") {
    input.type = "text";
  } else {
    input.type = json.properties[key].type;
  }

  if (json.properties[key].minLength) {
    input.minLength = json.properties[key].minLength;
  }
  if (json.properties[key].maxLength) {
    input.maxLength = json.properties[key].maxLength;
  }
  if (json.properties[key].minimum) {
    input.min = json.properties[key].minimum;
  }
  if (json.properties[key].maximum) {
    input.max = json.properties[key].maximum;
  }
  if (json.properties[key].pattern) {
    input.pattern = json.properties[key].pattern;
  }
  parentNode.appendChild(input);
}
