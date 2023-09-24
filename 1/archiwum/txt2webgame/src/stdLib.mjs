// https://gomakethings.com/how-to-update-localstorage-with-vanilla-javascript/
export function updateLocalStorage(key, value) {
  let existing = localStorage.getItem(key)
  let data = existing ? existing += value : value

  localStorage.setItem(key, data)
}

export function hello(txt, filename){
  updateLocalStorage(filename, txt)
}

window['hello'] = hello
window['updateLocalStorage'] = updateLocalStorage