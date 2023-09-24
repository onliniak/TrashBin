import { ref } from "vue"

export const sections = ref({})
export const clicked = ref("")

export function newSection(section) {
  sections.value[section] = { components: [] }
}
export function addComponent(section, component) {
  sections.value[section].components.push(component)
}
