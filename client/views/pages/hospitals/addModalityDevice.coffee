Template.addModalityDevice.events 'click #insertMDBut':(e) ->
  e.preventDefault()
  doc = AutoForm.getFormValues('insertModalityDeviceForm').insertDoc
  dep = Departments.findOne this.dep_id
  Departments.update({_id:this.dep_id},{$set:{name:dep.name},$push:{'modality_devices':doc}})
  $("#addModalityDeviceModal").modal 'hide'