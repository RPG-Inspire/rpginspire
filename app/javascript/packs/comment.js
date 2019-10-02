var axios = require('axios')
window.submitComment = function(topicId) {
  var article = document.querySelector('article[data-topic-id="' + topicId + '"]')
  var form = article.querySelector('form.new_comment')
  var serializedForm = serializeForm(form)

  if (!serializedForm['comment[body]'].value) {
    alert("Empty comment")
    return false
  }
  axios.post(form.action, {
    authenticity_token: serializedForm['authenticity_token'].value,
    comment: {
      body: serializedForm['comment[body]'].value,
      topic_id: topicId
    }
  })
    .then(function(response) {
      var ele = document.createElement('div')
      ele.innerHTML = response.data.content

      if (response.status == 200) {
        form.reset()
        article.querySelector('section.comments .comment').insertAdjacentHTML('beforeBegin', response.data.meta.content)
      }
    })
  return false
}

