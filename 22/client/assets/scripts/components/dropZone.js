/* eslint-disable array-callback-return */
import Reef from 'https://cdn.jsdelivr.net/npm/reefjs@10/+esm'

// const object1 = {
//   $schema: 'https://json-schema.org/draft/2019-09/schema',
//   type: 'object',
//   properties: {
//     txt: {
//       type: 'string',
//       minLength: 2,
//       maxLength: 3
//     }
//   }
// }

export const schema = new Reef('#rightSection', {
  data: {
    greeting: 'Hello',
    type: ''
  },
  setters: {
    rightPanelRender: function (params, typeVar) {
      params.type = typeVar
    }
  },
  template: function (props, elem, typeVar) {
    console.log(props.type)
    // setTimeout(() => {
    //   elem.children[0].addEventListener('click', event => {
    //     schema.data.greeting = document.querySelector('#rightSection > input').value
    //     document.querySelector('#dropZone > *').innerText = schema.data.greeting
    //   })
    // }, 1234)
    // const keys = Object.keys(object1.properties)
    // return `
    //     ${keys.map(function () {
    //         const name = object1.properties[keys]
    //         if (name.type === 'string') {
    //             return `
    //             <button></button>
    //             <input ${name.format === 'email' ? 'type="email"' : 'type="text"'} id="ss" name="name" required
    //    ${name.minLength ? `minlength="${name.minLength}"` : ''}
    //    ${name.maxLength ? `maxlength="${name.maxLength}"` : ''}
    //    ${name.pattern ? `pattern="${name.pattern}"` : ''} size="10">
    //             `
    //         } else if (name.type === 'number' || name.type === 'integer') {
    //             return `
    //             <input type="number" name="number"
    //             ${name.minimum || name.exclusiveMinimum ? `min="${name.minimum}||${name.exclusiveMinimum}"` : ''}
    //             ${name.maximum || name.exclusiveMaximum ? `max="${name.maximum}||${name.exclusiveMaximum}"` : ''}
    //             ${name.multipleOf ? `step="${name.multipleOf}"` : ''}>
    //             `
    //         }
    //     }

    //     ).join('')}`
  }
})
window.schema = schema
