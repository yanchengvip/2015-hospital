Template.addExaminedItem.events 'click #insertEIBut':(e) ->
  e.preventDefault()
  doc = AutoForm.getFormValues('insertExaminedItemForm').insertDoc
  dep = Departments.findOne this.dep_id
  Departments.update({_id:this.dep_id},{$set:{name:dep.name},$push:{'examined_items':doc}})
  $("#addExaminedItemModal").modal 'hide'