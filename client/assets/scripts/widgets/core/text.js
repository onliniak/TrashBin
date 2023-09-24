export function text (text) {
  const m = document.getElementsByTagName('main')[0]
  const p = document.createElement('p')
  const txt = document.createTextNode(text)
  p.append(txt)
  m.append(p)
  return p
}
