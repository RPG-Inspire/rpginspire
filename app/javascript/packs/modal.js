var rootEl = document.documentElement
var $modals = getAll('.modal')
var $modalButtons = getAll('.modal-button')
var $modalCloses = getAll('.modal-background, .modal-close, .modal-card-head .delete, .modal-card-foot .button')
var originalSlug = window.location['pathname']
var shouldReturnSlug = false

function loadXMLDoc(url, fn) {
  var xmlhttp = new XMLHttpRequest()
  var format = '.js'

  xmlhttp.onreadystatechange = function() {
    fn(xmlhttp)
  }

  xmlhttp.open("GET", url+format, true)
  xmlhttp.send()
}

function getAll(selector) {
  return Array.prototype.slice.call(document.querySelectorAll(selector), 0)
}

function returnOriginalSlug() {
  modifySlug(originalSlug)
}

function modifySlug(href) {
  window.history.pushState({}, '', href)
}

function prepareLazyLoad($el) {
  shouldReturnSlug = true
  modifySlug($el.href)
  loadXMLDoc($el.href, function(xmlhttp) {
    if (xmlhttp.readyState == XMLHttpRequest.DONE) {   // XMLHttpRequest.DONE == 4
      if (xmlhttp.status == 200) {
        document.getElementById("lazy-loaded-content").innerHTML = xmlhttp.responseText
      } else if (xmlhttp.status == 400) {
        alert('There was an error 400')
      } else {
        alert('something else other than 200 was returned')
      }
    }
  })
}

if ($modalButtons.length > 0) {
  $modalButtons.forEach(function ($el) {
    $el.addEventListener('click', function (e) {
      e.preventDefault()
      var target = $el.dataset.target
      if ($el.dataset.lazyLoaded) {
        prepareLazyLoad($el)
      }
      openModal(target)
    })
  })
}

if ($modalCloses.length > 0) {
  $modalCloses.forEach(function ($el) {
    $el.addEventListener('click', function () {
      closeModals()
    })
  })
}

function openModal(target) {
  var $target = document.getElementById(target)
  rootEl.classList.add('is-clipped')
  $target.classList.add('is-active')
}

function closeModals() {
  rootEl.classList.remove('is-clipped')
  getAll('.modal.is-active').forEach(function ($el) {
    if ($el.dataset.isLazy) {
      returnOriginalSlug()
    }
    $el.classList.remove('is-active')
  })
}

document.addEventListener('keydown', function (event) {
  var e = event || window.event
  if (e.keyCode === 27) {
    closeModals()
  }
})
