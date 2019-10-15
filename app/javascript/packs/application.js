// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/activestorage").start()
require("channels")
require("./helpers.js")
require("./upvote.js")
require("./comment.js")
require("./dropdown.js")
require("./modal.js")
require("./upload.js")
require("./tab.js")
require("./tr.js")
require("./infinite_scroll.js")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//var signin_btn = document.getElementById('signin-btn')
//signin_btn.addEventListener("click", function(e) {
//  e.preventDefault()
//  var signin_modal = document.getElementById('signin-modal')
//  signin_modal.className += " is-active"
//});
