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

Template.editModalityDevice.events 'click #updateMDBut':(e) ->
  e.preventDefault()
  doc = AutoForm.getFormValues('updateModalityDeviceForm').insertDoc
  console.log(doc)
  console.log(this.doc)
  dep = Departments.findOne this.doc.dep_id
  console.log(this.doc.dep_id)
  Departments.update({_id:this.doc.dep_id},{$set:{name:dep.name},$pull:{'modality_devices':this.doc}})
  Departments.update({_id:this.doc.dep_id},{$set:{name:dep.name},$push:{'modality_devices':doc}})
  $("#editModalityDeviceModal").modal 'hide'
