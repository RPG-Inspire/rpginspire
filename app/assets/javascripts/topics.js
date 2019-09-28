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
    text: 'Start typing your text here :)'
  }
});
