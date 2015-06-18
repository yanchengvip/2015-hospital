Template.addModalityDevice.helpers
  addModalityDeviceSchema:->
    Schema.ModalityDevices
  'device_id':->
    new Meteor.Collection.ObjectID()._str
Template.addModalityDevice.events 'click #insertMDBut':(e) ->
  e.preventDefault()
  doc = AutoForm.getFormValues('insertModalityDeviceForm').insertDoc
  console.log(doc)
  console.log(this)
  dep = Departments.findOne this.dep_id
  Departments.update({_id:this.dep_id},{$set:{name:dep.name},$push:{'modality_devices':doc}})
  $("#addModalityDeviceModal").modal 'hide'