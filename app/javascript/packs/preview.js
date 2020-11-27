function preview() {
  const IconImage = document.getElementById('icon-image')

  const createImageHTML = (blob) =>{
    const imageElement = document.createElement('div');
    imageElement.setAttribute('class', "image-element")
    let imageElementNum = document.querySelectorAll('.image-element').length

    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob)
    blobImage.setAttribute('id',"preview-image")

    const inputHTML = document.createElement('input')
    inputHTML.setAttribute('id', 'shop_image_${imageElementNum}')
    inputHTML.setAttribute('name', 'shop[images][]')
    inputHTML.setAttribute('type', 'file')

    imageElement.appendChild(blobImage)
    imageElement.appendChild(inputHTML)
    IconImage.appendChild(imageElement)

    inputHTML.addEventListener('change', (e)=>{
      file = e.target.files[0];
      blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    })
  }

  document.getElementById('publish-image').addEventListener('change',function(e){
    // const imageContent = document.querySelector('img');
    // if (imageContent){
    //   imageContent.remove();
    // }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    
    createImageHTML(blob);
  })
}
if(document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener("load", preview);
}