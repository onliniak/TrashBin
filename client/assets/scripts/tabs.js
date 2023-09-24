export function opentab (e) {
  const klass = e.className
  document.querySelectorAll('aside#left > section#categories > div').forEach(function (c) {
    if (c.classList.contains(klass)) {
      c.classList.toggle('opentab')
    }
  })
}
