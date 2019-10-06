if (typeof(MediumEditor) !== "undefined") {
  var editor = new MediumEditor('.editable', {
    autoLink: true,
    delay: 1000,
    targetBlank: true,
    anchor: {
      placeholderText: 'Type a link',
      customClassOption: 'btn',
      customClassOptionText: 'Create Button'
    },
    paste: {
      forcePlainText: true,
      cleanPastedHTML: true,
      cleanAttrs: ['style', 'dir'],
      cleanTags: ['label', 'meta'],
      unwrapTags: ['sub', 'sup']
    },
    anchorPreview: {
      hideDelay: 300
    },
    placeholder: {
      text: ''
    }
  })
}

$tabButtons = getAll('.topic-tab.tabs a')
if ($tabButtons.length > 0) {
  $tabButtons.forEach(function ($el) {
    $el.addEventListener('click', function (e) {
      e.preventDefault()
    })
  })
}

$tagboxes = getAll('.tags-selector input.checkbox')
if ($tagboxes.length > 0) {
  $tagboxes.forEach(function ($el) {
    $el.addEventListener('change', function(e) {
      var submitBtn = document.querySelector('input[data-enabler]')
      if (getCheckedBoxes('.tags-selector input.checkbox').length > 0) {
        submitBtn.classList.remove('is-dark')
        submitBtn.classList.add('is-primary')
        submitBtn.disabled = false
      } else {
        submitBtn.disabled = true
        submitBtn.classList.remove('is-primary')
        submitBtn.classList.add('is-dark')
      }
    })
  })
}

function getCheckedBoxes(chkboxSelector) {
  var checkboxes = getAll(chkboxSelector)
  var checkboxesChecked = []
  // loop over them all
  checkboxes.forEach(function($el) {
    for (var i=0; i<checkboxes.length; i++) {
      // And stick the checked ones onto an array...
      if (checkboxes[i].checked) {
         checkboxesChecked.push(checkboxes[i])
      }
    }
  })

  return checkboxesChecked;
}

