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
      canvas = me.find('canvas');
      video.src = window.URL.createObjectURL(localMediaStream);
      stream = localMediaStream
      video.onloadedmetadata = (e)->
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
  , errorCallback)
  $('.summernote').summernote({
      lang: 'zh-CN'
      toolbar: [
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough', 'superscript', 'subscript']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
      ]
  })
#  this.$('.summernote').summernote();
Template.usreports.events
  'dblclick img[name=captureImage]':(e,t)->
    dom = $("<img src="+this.url()+">")
    t.$('#report_content_note').summernote('insertNode',dom[0])
  'summernote.change #report_content_note':(e,t,edit)->
#    console.log this
#    console.log e,t,edit
  'summernote.image.upload #report_content_note':(e,t)->
#  这个事件没反应
#    console.log this
  'click a[id=saveReport]':(e,t)->
#  保存
    t.$('#usReportForm').submit()
  'submit form':(e,t)->
    insertDoc = AutoForm.getFormValues(@id).insertDoc
    insertDoc.usfind = t.$('#report_content_note').code()
    try
      check(insertDoc,Laniakea.Schema.UsReport)
    catch e
      toastr.error(e.message)
      return
    Laniakea.Collection.UsReports.insert(insertDoc)
    AutoForm.resetForm(@id)
  'click a[id=capture]':(e,t)->
    instance = Template.instance()
    video = t.find('video')
    canvas = t.find('canvas')
    ctx = canvas.getContext('2d')
    if stream?
      ctx.drawImage(video,0,0)
      dataURL = canvas.toDataURL('image/png')
      Laniakea.Collection.UsReportImages.insert dataURL,(error,fileObj)->
        unless error
          number+=1
          img =
            _id:fileObj._id
            number:number
          imgs = instance.imgs.get()
          imgs.push img
          instance.imgs.set(imgs)

  'change #video':(e,t)->
    console.log e
    console.log this.data
    t.find('video').src = this.data.url;
Template.usreports.helpers
  'imgs':->
    Template.instance().imgs.get().map (i)->
      Laniakea.Collection.UsReportImages.findOne(i._id)
  'imgurl':(id)->
    Laniakea.Collection.UsReportImages.findOne(id)?.url()
  'usreports':->
    Laniakea.Collection.UsReports.find()
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