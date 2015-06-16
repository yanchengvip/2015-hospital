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
number = 0
Template.usreports.created = ->
  number = 0
  me = this
  me.imgs = new ReactiveVar([])
Template.usreports.onRendered ->
  me = this
  errorCallback = (e)->
    console.log('Reeeejected!', e);
  #      navigator.getUserMedia(hdConstraints, successCallback, errorCallback);
  navigator.getUserMedia(hdConstraints, (localMediaStream)->
    if localMediaStream?
      video =  me.find('video');
      video.src = window.URL.createObjectURL(localMediaStream);
      stream = localMediaStream
      video.onloadedmetadata = (e)->
        console.log '初始化成功'
  , errorCallback)
  this.$('.summernote').summernote();
Template.usreports.events
  'click a[id=saveReport]':(e,t)->
    t.$('#usReportForm').submit()
  'submit form':(e,t)->
    insertDoc = AutoForm.getFormValues(@id).insertDoc
    insertDoc.us_finding = t.$('#us_finding_note').code()
    Laniakea.Collection.USReports.insert(insertDoc)
    AutoForm.resetForm(@id)
  'click a[id=capture]':(e,t)->
    video = t.find('video')
    canvas = t.find('canvas')
    ctx = canvas.getContext('2d')
    if stream?
      ctx.drawImage(video,0,0,110,80)
      number+=1
      img =
        number: number
        url:canvas.toDataURL('image/webp')
      imgs = Template.instance().imgs.get()
      imgs.push img
      Template.instance().imgs.set(imgs)
  'change #video':(e,t)->
    console.log e
    console.log this.data
    t.find('video').src = this.data.url;
Template.usreports.helpers
  'imgs':->
    Template.instance().imgs.get()
  'usreports':->
    Laniakea.Collection.USReports.find()
  'removeHTMLTag':(str)->
#    去除HTML tag
    str = str.replace(/<\/?[^>]*>/g,'');
#    去除行尾空白
    str = str.replace(/[ | ]*\n/g,'\n');
#    去除多余空行
    str = str.replace(/\n[\s| | ]*\r/g,'\n');
#    去掉&nbsp;
    str=str.replace(/&nbsp;/ig,'');
    str;