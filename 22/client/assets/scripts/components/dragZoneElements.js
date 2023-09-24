import Reef from 'https://cdn.jsdelivr.net/npm/reefjs@10/+esm'
import { sections } from '../stores/dragZoneStore.js'

export function renderComponents (button) {
  const content = new Reef('#leftSection', {
    store: sections,
    template: function (props) {
      const components = props.sections[button].components.join('')
      return components
    }
  })
  content.render()
}
