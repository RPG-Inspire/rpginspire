const siteviewing = 'SiteViewing'

window.clickNewPost = function() {
  ga('send', 'event', {
    eventCategory: 'newPost',
    eventAction: 'click',
    eventLabel: siteviewing
  });
}

window.submitNewPost = function(type) {
  ga('send', 'event', {
    eventCategory: 'newPost',
    eventAction: 'submit',
    eventLabel: type
  });
}

window.submitSignup = function(type) {
  if (!ga) { return true }
  ga('send', 'event', {
    eventCategory: 'signup',
    eventAction: 'submit',
    eventLabel: type
  });
}

window.clickLink = function() {
  ga('send', 'event', {
    eventCategory: 'link',
    eventAction: 'click',
    eventLabel: siteviewing
  });
}

window.submitTags = function() {
  ga('send', 'event', {
    eventCategory: 'tags',
    eventAction: 'submit',
  });
}

window.submitUpvote = function() {
  ga('send', 'event', {
    eventCategory: 'upvote',
    eventAction: 'submit',
    eventLabel: siteviewing
  });
}

window.clickPreview = function() {
  ga('send', 'event', {
    eventCategory: 'preview',
    eventAction: 'click',
    eventLabel: siteviewing
  });
}
