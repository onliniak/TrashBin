function defaultTemplate(description, content, img = null) {
  if (img) {
    let newImg = Image(800, 600)
    newImg.loading = 'lazy'
    newImg.src = img
    document.getElementById('article').appendChild(newImg)
  }
  document.getElementById('article').appendChild(`<div id="description">${description}</div> <div id="content">${content}</div>`)
}

window['defaultTemplate'] = defaultTemplate()