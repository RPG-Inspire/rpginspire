const axios = require('axios')

var $upvote = getAll('.upvote')
var upvoteClick = function(e) {
  if (this.ref.dataset.active === "true") { return }

  axios.patch('/api/topics/' + this.id + '/upvote', csrfObj())
   .then((function (response) {
     var count = this.ref.querySelector('span').innerHTML
     this.ref.querySelector('span').innerHTML = parseInt(count)+1
     this.ref.dataset.active = true
   }).bind({ref: this.ref}))
}

if ($upvote.length > 0) {
  $upvote.forEach(function(e) {
    addEvent(e, 'click', upvoteClick.bind({ref: e, id: e.dataset.topicId}))
  })
}
