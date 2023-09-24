import Reef from 'https://cdn.jsdelivr.net/npm/reefjs@10/+esm'

export const jsonList = new Reef.Store({
  data: {
    list: { children: [] },
    dragIndex: 0
  },
  setters: {
    swap: function (props, x, y) {
      const b = props.list.children[y]
      props.list.children[y] = props.list.children[x]
      props.list.children[x] = b
      props.dragIndex = 0
    },
    push: function (props, elm) {
      props.list.children.push(elm)
    },
    addDragIndex: function (props, index) {
      props.dragIndex = index
    }
  },
  getters: {
    index: function (props, element) {
      return Array.from(element.parentNode.children).indexOf(element)
    },
    list: function (props) {
      return props.list.children
    },
    isChildrenKnew: function (props, index) {
      return props.list.children[index]
    }
  }
})
