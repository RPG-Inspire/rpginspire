const axios = require('axios')

window.upvoteClick = function(e) {
  if (e.dataset.active === "true") { return }
  submitUpvote()

  axios.patch('/api/topics/' + e.dataset.topicId + '/upvote', csrfObj())
   .then((function (response) {
     var count = this.ref.querySelector('span').innerHTML
     this.ref.querySelector('span').innerHTML = parseInt(count)+1
     this.ref.dataset.active = true
   }).bind({ref: e}))
}
