let request = window.location.pathname
let fileName = request.substring(16)
let article = document.getElementsByTagName('article')

class Store {
  constructor(dbName = 'keyval-store', storeName = 'keyval') {
    this.storeName = storeName
    this._dbp = new Promise((resolve, reject) => {
      const openreq = indexedDB.open(dbName, 1)
      openreq.onerror = () => reject(openreq.error)
      openreq.onsuccess = () => resolve(openreq.result)
      // First time setup: create an empty object store
      openreq.onupgradeneeded = () => {
        openreq.result.createObjectStore(storeName)
      }
    })
  }
  _withIDBStore(type, callback) {
    return this._dbp.then(db => new Promise((resolve, reject) => {
      const transaction = db.transaction(this.storeName, type)
      transaction.oncomplete = () => resolve()
      transaction.onabort = transaction.onerror = () => reject(transaction.error)
      callback(transaction.objectStore(this.storeName))
    }))
  }
}
let store
function getDefaultStore() {
  if (!store)
    store = new Store()
  return store
}
function get(key, store = getDefaultStore()) {
  let req
  return store._withIDBStore('readonly', store => {
    req = store.get(key)
  }).then(() => req.result)
}
function set(key, value, store = getDefaultStore()) {
  return store._withIDBStore('readwrite', store => {
    store.put(value, key)
  })
}

let cacche = get(`${fileName}Intro`)
let Img = get(`${fileName}Img`)

cacche.then(function (response) {
  if (response != undefined) {

    div = document.createElement('div')
    div.id = 'main'
    description = document.createTextNode(get(`${fileName}Intro`))
    Intro = div.appendChild(description)

    Img.then(function (response) {
      if (response != undefined) {
        newImg = new Image(800, 600)
        newImg.loading = 'lazy'
        newImg.src = response
        document.getElementById('main')
          .appendChild(newImg)
      }

      let sp2 = document.getElementById('main')
      let parentDiv = sp2.parentNode
      parentDiv.insertBefore(sp1, sp2)
    })

    //div2 = document.createElement("div")
    //mainHtml = document.createTextNode(get(`${fileName}Intro`));
    //Content = div.appendChild(mainHtml)

    document.getElementsByTagName('article')[0]
      .appendChild(Intro)
  } else {
    fetchPartials(fileName)
      .then(json => render(json))
  }
})