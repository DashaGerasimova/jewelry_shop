function saveImg() {
  var dataURL = canvas.toDataURL("image/png");
  document.querySelector("#image").value = dataURL;
}
