export function blobToBase64(blob, callback) {
  const fileReader = new FileReader()
  fileReader.readAsDataURL(blob)
  fileReader.onload = function(e) {
    callback && callback(e.target.result)
  }
}

export function readBlobToDownload(blob, name) {
  const file = new FileReader()
  file.readAsDataURL(blob)
  file.onload = function(e) {
    const a = document.createElement('a')
    a.style.display = 'none'
    a.href = e.target.result
    a.download = name || blob.name
    document.body.appendChild(a)
    a.click()
  }
}

export function downloadA(url, name) {
  const a = document.createElement('a')
  a.style.display = 'none'
  a.href = url
  a.download = name
  document.body.appendChild(a)
  a.click()
}
