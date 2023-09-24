const str = 
      `A:
  a: 1
  c: 3
  b: 9
  f: 3
B:
  a: 3
  c: 5
  s: 4`
const regexp = /(\w):\s*((\w):\s+(\w))*(\w)*/g
const array = [...str.matchAll(regexp)]

const district = /^\S$|^\S*\S$/gm
const str2 = str.replaceAll(/:/g, '')
const array2 = [...str2.matchAll(district)]
let i,g

function dynamicArrayVariables(variable) {
  window[variable] = []
}
array2.forEach(dynamicArrayVariables)

for (i = 0; i < array.length; i++) {
  const array = [...str.matchAll(regexp)]
  if (typeof array[i][5] === 'undefined')
    g = i
  if (typeof array[i][3] != 'undefined'){
    let key = array[i][3]
    window[array[g][1]].push({ [key]: array[i][4] })
  }
  
  if (typeof array[i][3] === 'undefined')
    if (array[i][1] != array[i][3]){
      let key = array[i][1]
      window[array[g][1]].push({ [key]: array[i][5] })
    }
}

// console.log(A)