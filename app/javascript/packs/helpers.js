window.loadXMLDoc = function(url, fn) {
  var xmlhttp = new XMLHttpRequest()
  var format = '.js'

  xmlhttp.onreadystatechange = function() {
    fn(xmlhttp)
  }

  xmlhttp.open("GET", url+format, true)
  xmlhttp.send()
}

window.filterList = function() {
  var activeFilters = getAll('[data-filter]:not(.is-outlined)')
  var filters = []

  activeFilters.forEach(function($el) {
    filters.push($el.dataset['title'])
  })

  return filters
}

window.nextPage = function() {
  var infiniteContent = document.querySelector('#infinite-content')
  return infiniteContent.dataset['nextPage']
}

window.setNextPage = function(nextPage) {
  var infiniteContent = document.querySelector('#infinite-content')
  infiniteContent.dataset['nextPage'] = nextPage
}

window.getAll = function(selector) {
  return Array.prototype.slice.call(document.querySelectorAll(selector), 0)
}
window.addEvent = function(el, type, handler) {
  if (el.attachEvent) el.attachEvent('on'+type, handler); else el.addEventListener(type, handler)
  return handler
}
window.removeEvent = function(el, type, handler) {
  if (el.detachEvent) el.detachEvent('on'+type, handler); else el.removeEventListener(type, handler)
}

window.csrfObj = function() {
  var head = document.head,
    param = head.querySelector('meta[name=csrf-param]').content,
    token = head.querySelector('meta[name=csrf-token]').content,
    obj = {}
  obj[param] = token
  return obj
}

window.serializeForm = function(form) {
  var field, l = [],
    s = {}
  if (typeof form == 'object' && form.nodeName == "FORM") {
    var len = form.elements.length
    for (var i=0; i<len; i++) {
      field = form.elements[i]
      if (field.name && !field.disabled && field.type != 'file' && field.type != 'reset' && field.type != 'submit' && field.type != 'button') {
        if (field.type == 'select-multiple') {
          l = form.elements[i].options.length
          for (j=0; j<l; j++) {
            if(field.options[j].selected)
              s[field.name] = { name: field.name, value: field.options[j].value }
            }
        } else if ((field.type != 'checkbox' && field.type != 'radio') || field.checked) {
            s[field.name] = { name: field.name, value: field.value }
        }
      }
    }
  }

  return s
}

