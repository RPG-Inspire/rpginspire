var axios = require('axios')
var $filters = getAll('[data-filter]')

if ($filters.length > 0) {
  $filters.forEach(function ($el) {
    $el.addEventListener('click', function (e) {
      e.preventDefault()

      if (this.classList.contains('is-outlined')) {
        this.classList.remove('is-outlined')
      } else {
        this.classList.add('is-outlined')
        this.blur()
      }

      axios.get("/topics", {params: {tags: filterList(), format: 'json'}, })
        .then((function (response) {
          var infiniteContent = document.querySelector('#infinite-content')
          infiniteContent.innerHTML = ""

          var e = document.createElement('div')
          e.innerHTML = response.data.content
          e.childNodes.forEach(function(node) {
            infiniteContent.appendChild(node)
          })

          setNextPage(response.data.meta.next_page)
        }))
    })
  })
}

