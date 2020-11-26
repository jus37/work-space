function preview() {
  const IconImage = document.getElementById('icon-image')
  document.getElementById('user_image').addEventListener('change',function(e){
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const imageElement = document.createElement('div');
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob)

    imageElement.appendChild(blobImage)
    IconImage.appendChild(imageElement)
  })
}
if(document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener("load", preview);
}