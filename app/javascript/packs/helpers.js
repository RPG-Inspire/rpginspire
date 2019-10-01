window.loadXMLDoc = function(url, fn) {
  var xmlhttp = new XMLHttpRequest()
  var format = '.js'

  xmlhttp.onreadystatechange = function() {
    fn(xmlhttp)
  }

  xmlhttp.open("GET", url+format, true)
  xmlhttp.send()
}

window.getAll = function(selector) {
  return Array.prototype.slice.call(document.querySelectorAll(selector), 0)
}
window.addEvent = function(el, type, handler) {
  if (el.attachEvent) el.attachEvent('on'+type, handler); else el.addEventListener(type, handler);
  return handler
}
window.removeEvent = function(el, type, handler) {
  if (el.detachEvent) el.detachEvent('on'+type, handler); else el.removeEventListener(type, handler);
}

window.csrfObj = function() {
  var head = document.head,
    param = head.querySelector('meta[name=csrf-param]').content,
    token = head.querySelector('meta[name=csrf-token]').content,
    obj = {}
  obj[param] = token
  return obj
}

