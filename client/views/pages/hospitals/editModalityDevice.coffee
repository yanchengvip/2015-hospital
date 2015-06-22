#AutoForm.hooks
#  updateModalityDeviceForm:
#    onError: (operation, error)->
#      console.log("添加失败" + error)
#    onSuccess: ->
#      console.log("onSuccess" )
#      console.log(this)
#    onSubmit:(insertDoc, updateDoc, currentDoc)->
#
#      console.log(this)
#Template.editModalityDevice.helpers
#  'hospital': ->
##    Hospitals.find()
Template.editModalityDevice.helpers
  editModalityDeviceSchema:->
    Schema.ModalityDevices


Template.editModalityDevice.events 'click #updateMDBut':(e) ->
  e.preventDefault()
  doc = AutoForm.getFormValues('updateModalityDeviceForm').insertDoc
#  doc =  $("#updateModalityDeviceForm").serialize()
  console.log doc
  dep = Departments.findOne this.dep_id
  devices = dep.modality_devices
  i = 0
  l = devices.length
  new_devices=[]
  while i < l
    if devices[i]._id==doc._id
      new_devices.push(doc)
    else
      new_devices.push(devices[i])
    i++
  Departments.update({_id:this.dep_id},{$set:{name:dep.name,'modality_devices':new_devices}})
  $("#editModalityDeviceModal").modal 'hide'
