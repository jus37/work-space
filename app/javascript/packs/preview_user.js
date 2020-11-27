function previewUser() {
  const IconImage = document.getElementById('icon-image')

  const createImageHTML = (blob) =>{
    const imageElement = document.createElement('div');

    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob)
    blobImage.setAttribute('id',"preview-image")

    imageElement.appendChild(blobImage)
    IconImage.appendChild(imageElement)

  }

  document.getElementById('publish-user-image').addEventListener('change',function(e){
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    
    createImageHTML(blob);
  })
}
if(document.URL.match( /users/ ) && (document.URL.match( /new/ ) || document.URL.match( /edit/ ))) {
  window.addEventListener("load", previewUser);
}