const axios = require('axios')

var $infiniteContent = document.getElementById('infinite-content')

if ($infiniteContent) {
  function activateScrollable(url) {
    window.addEvent(window, 'scroll', scrollEvent.bind({url: url}))
  }

  function pageYOffset(doc) {
    return top = (window.pageYOffset || doc.scrollTop)  - (doc.clientTop || 0)
  }

  var scrollEvent = function() {
    if (shouldFetch() && nextPage() != "null") {
      if (this.fetching) { return }
      this.fetching = true
      window.removeEvent(window, 'scroll', function a() {})
      axios.get(this.url, {params: {page: nextPage(), tags: filterList(), format: 'json'}, })
        .then((function (response) {
          var e = document.createElement('div')
          e.innerHTML = response.data.content

          var infiniteContent = document.body.querySelector('#infinite-content')
          e.childNodes.forEach(function(node) {
            infiniteContent.appendChild(node)
          })

          setNextPage(response.data.meta.next_page)
          this.that.fetching = false
        }).bind({that: this}))
    }
  }

  function getDocHeight(doc) {
    return Math.max(
        doc.body.scrollHeight, doc.documentElement.scrollHeight,
        doc.body.offsetHeight, doc.documentElement.offsetHeight,
        doc.body.clientHeight, doc.documentElement.clientHeight
    )
  }

  function amountScrolled() {
    var winheight= window.innerHeight || (document.documentElement || document.body).clientHeight
    var docheight = getDocHeight(document)
    var scrollTop = window.pageYOffset || (document.documentElement || document.body.parentNode || document.body).scrollTop
    var trackLength = docheight - winheight
    var pctScrolled = Math.floor(scrollTop/trackLength * 100) // gets percentage scrolled (ie: 80 or NaN if tracklength == 0)

    return pctScrolled
  }

  function shouldFetch() {
    var threshold = 75

    return amountScrolled() > threshold
  }

  activateScrollable($infiniteContent.dataset.url)
}
