// Copied from https://javascript.info/file
export function readFile(input) {
  let file = input.files[0]
  let reader = new FileReader()
  reader.readAsText(file)
  
  reader.onload = function() {
    parseFile(reader.result, file.name)
  }
  
  reader.onerror = function() {
    console.log(reader.error)
  }
  
}

export function parseFile(content, file) {
  const regexp = /^(.*?):\s(.*)$/gm
  const definitions = [...content.matchAll(regexp)]

  for (let index = 0; index < definitions.length; index++) {
    let key = definitions[index][1].trim()
    let value = definitions[index][2].trim()
    let filename = file.slice(0, -5)
    Function(`${key}('${value}', '${filename}')`)()       
  }
}

window['readFile'] = readFile
window['parseFile'] = parseFile