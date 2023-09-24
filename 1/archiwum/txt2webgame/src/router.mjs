export function render() {
  window.onhashchange = function () {
    let currentUrl = location.hash.match(/\b([^#]+)/)[0]
    if (Object.prototype.hasOwnProperty.call(localStorage, currentUrl)) {
      console.log('found')
    }
    //document.querySelector('#description').innerText
  }
}