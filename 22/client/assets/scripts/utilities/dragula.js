import { schema } from '../components/dropZone.js'
import { jsonList } from '../stores/dropZoneStore.js'

// eslint-disable-next-line no-undef
dragula([document.querySelector('.dragZone'), document.getElementById('dropZone')], {
  removeOnSpill: true,
  copy: function (el, source) {
    return source === document.querySelector('.dragZone')
  },
  accepts: function (el, target) {
    return target !== document.querySelector('.dragZone')
  }
}).on('cloned', function (el) {
  el.addEventListener('dblclick', function () {
    // const widget = el.dataset.widget
    // const params = el.dataset.params || 'test'
    // getSchema(widget, params)
    el.innerText = schema.data.greeting
    schema.render()
  })
}).on('drop', function (element) {
  if (element.src.includes('font')) {
    schema.do('rightPanelRender', 'font')
  }
  const index = jsonList.get('index', element)
  jsonList.get('isChildrenKnew', index)
    ? jsonList.do('swap', jsonList.data.dragIndex, index)
    : jsonList.do('push', { txt: element.textContent })
}).on('drag', function (element) {
  if (element.parentNode.nodeName === 'main') {
    const index = jsonList.get('index', element)
    jsonList.do('addDragIndex', index)
  }
})

// function getSchema (fun, params) {
//   const render = {
//     txt: text(params)
//   }
//   return render.fun
// }
