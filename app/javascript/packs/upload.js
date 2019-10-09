const $fileInputs = document.querySelectorAll('input[type=file]')
if ($fileInputs.length > 0) {
  $fileInputs.forEach(function(fileInput) {
    fileInput.onchange = (function() {
      if (fileInput.files.length > 0) {
        console.log(this.self)
        var target = this.self.dataset.target
        console.log(target)
        const fileName = document.getElementById(target)
        fileName.textContent = this.self.files[0].name;
      }
    }).bind({self: fileInput})
  })
}
