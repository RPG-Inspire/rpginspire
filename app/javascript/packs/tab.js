$tabs = document.querySelectorAll('.tabs')
if ($tabs.length > 0) {
  $tabs.forEach(function(tab) {
    tab.querySelectorAll('li').forEach((function(tabSelector) {
      addEvent(tabSelector, 'click', (function() {
        cleanActive(this.tab)
        setActive(this.self)
        cleanActive(document.getElementById(this.tab.dataset.target))
        setActive(document.getElementById(this.self.dataset.target))
      }).bind({self: tabSelector, tab: this.tab}))
    }).bind({tab: tab}))
  })
}

function displayTab(target ) {
}

function cleanActive($ele) {
  $ele.querySelector('.is-active').classList.remove('is-active')
}

function setActive($ele) {
  $ele.classList.add('is-active')
}
