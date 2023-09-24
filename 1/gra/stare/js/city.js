for (let element of obj.city[0].district) {
  newDiv = document.createElement("div")
  newDiv.id = element.name
  document.body.appendChild(newDiv)

  header = document.createElement("strong")
  header.textContent = element.name
  newDiv.appendChild(header)

  ul = document.createElement("ul")

  for (let element2 of element.location) {
    newDiv1 = document.getElementById(element.name);

    location_name = element2.name
    location_link = element2.link

    a = document.createElement("a")
    a.href = location_link
    a.textContent = location_name

    list = document.createElement("li")
    list.appendChild(a)
    ul.appendChild(list)

    newDiv1.appendChild(ul)
  }
}