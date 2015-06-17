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

Template.editExaminedItem.events 'click #updateEIBut':(e) ->
  e.preventDefault()
  doc = AutoForm.getFormValues('updateExaminedItemForm').insertDoc
  console.log(doc)
  console.log(this.doc)
  dep = Departments.findOne this.doc.dep_id
  console.log(this.doc.dep_id)
  Departments.update({_id:this.doc.dep_id},{$set:{name:dep.name},$pull:{'examined_items':this.doc}})
  Departments.update({_id:this.doc.dep_id},{$set:{name:dep.name},$push:{'examined_items':doc}})
  $("#editExaminedItemModal").modal 'hide'
