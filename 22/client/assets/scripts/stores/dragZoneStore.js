import Reef from 'https://cdn.jsdelivr.net/npm/reefjs@10/+esm'

export const sections = new Reef.Store({
  data: {
    sections: {}
  },
  setters: {
    /**
   * Create new section
   *
   * @param {Object} props props is equivalent of data object/container
   * @param {Object} props.sections
   * @param {Object} props.sections.section
   * @param {Object[]} props.sections.section.components[]
   */
    newSection: function (props, section) {
      props.sections[section] = { components: [] }
    },
    /**
   *  Add component to section
   *
   * @param {Object} props props is equivalent of data object/container
   * @param {Object} props.sections
   * @param {Object} props.sections.section
   * @param {Object[]} props.sections.section.components[]
   * @param {Node} component node element to be dragged and dropped
   */
    addComponent: function (props, section, component) {
      props.sections[section].components.push(component)
    }
  }
})
