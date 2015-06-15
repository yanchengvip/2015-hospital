navigator.getUserMedia = (navigator.getUserMedia ||
  navigator.webkitGetUserMedia ||
  navigator.mozGetUserMedia ||
  navigator.msGetUserMedia)
hdConstraints =
  video:true
vgaConstraints  =
  video:true
  width:640
  height:360
stream = null
Template.ultrasonics.events
  'click a[id=startReport]':(e,t)->
    errorCallback = (e)->
      console.log('Reeeejected!', e);
#      navigator.getUserMedia(hdConstraints, successCallback, errorCallback);
    navigator.getUserMedia(vgaConstraints, (localMediaStream)->
      if localMediaStream?
        video =  t.find('video');
        video.src = window.URL.createObjectURL(localMediaStream);
        stream = localMediaStream
        video.onloadedmetadata = (e)->
          console.log '初始化成功'
    , errorCallback)
  'click a[id=capture]':(e,t)->
    instance =
    video = t.find('video')
    canvas = t.find('canvas')
    ctx = canvas.getContext('2d')
    if stream?
      ctx.drawImage(video,0,0,307,250)
#      t.find('img').src = canvas.toDataURL('image/webp');

  'change #video':(e,t)->
    console.log e
    console.log this.data
    t.find('video').src = this.data.url;
Template.ultrasonics.helpers
  'imgs':->