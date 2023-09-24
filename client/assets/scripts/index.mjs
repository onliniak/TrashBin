import { opentab } from './tabs.js'
import { text } from './widgets/core/text.js'
// import * as JsonSchema from 'https://cdn.jsdelivr.net/npm/@hyperjump/json-schema@0.17.2/dist/json-schema-esm.min.js'

function render (fun, params) {
  const render = {
    txt: text(params)
  }
  return render.fun
}

const TemplateObject = [{}]
// TemplateObject[0]["text"] = 2

window.opentab = opentab
window.TemplateObject = TemplateObject

// eslint-disable-next-line no-undef
dragula([document.getElementById('coreCategory'), document.getElementById('dropzone')], {
  copy: true
}).on('cloned', function (el) {
  el.addEventListener('dblclick', function (e) {
    const widget = el.dataset.widget
    const params = el.dataset.params || 'test'
    render(widget, params)
    // const schema = (async () => {
    //   await JsonSchema.get('http://example.com/schemas/string')
    // })()
    // const output = (async () => {
    //   await JsonSchema.validate(schema, 'foo')
    // })()

    // if (output.valid) {
    //   console.log('Instance is valid :-)')
    // } else {
    //   console.log('Instance is invalid :-(')
    // }
  })
})
