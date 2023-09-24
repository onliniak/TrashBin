import { ref } from "@vue/reactivity"

export const dropTagName = ref("")

export const dropList = ref([])
export const dropCurrentIndex = ref(0)

export function Currentindex(element) {
  return Array.from(element.parentNode.children).indexOf(element)
}
export function areChildrenKnew(index) {
  return dropList.value[index]
}
export function pushChildren(element) {
  dropList.value.push(element)
}
export function swapChildrens(x, y) {
  const b = dropList.value[y]
  dropList.value[y] = dropList.value[x]
  dropList.value[x] = b
  dropCurrentIndex.value = 0
}