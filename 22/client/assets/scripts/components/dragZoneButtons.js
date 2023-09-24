import Reef from 'https://cdn.jsdelivr.net/npm/reefjs@10/+esm'
import { sections } from '../stores/dragZoneStore.js'
import { renderComponents } from './dragZoneElements.js'

const ICONS_URL = 'http://localhost:8080/node_modules/bootstrap-icons/icons/'

sections.do('newSection', 'core')
sections.do('addComponent', 'core', `<img loading="lazy" style="width:32px" src="${ICONS_URL}type-h1.svg">`)
sections.do('addComponent', 'core', `<img loading="lazy" style="width:32px" src="${ICONS_URL}fonts.svg">`)
sections.do('addComponent', 'core', `<img loading="lazy" style="width:32px" src="${ICONS_URL}image.svg">`)
sections.do('addComponent', 'core', `<img loading="lazy" style="width:32px" src="${ICONS_URL}table.svg">`)
sections.do('addComponent', 'core', `<img loading="lazy" style="width:32px" src="${ICONS_URL}house.svg">`)

export const app = new Reef('#buttonsLine', {
  store: sections,
  template: function (props) {
    const keys = Object.keys(props.sections)
    return `
    ${keys.map(function (name) {
      return `
      <button>${name}</button>`
    }).join('')}`
  }
})

setTimeout(() => {
  document.querySelectorAll('#buttonsLine > button').forEach(item => {
    item.addEventListener('click', event => {
      renderComponents(event.target.innerText)
    })
  })
}, 234)
