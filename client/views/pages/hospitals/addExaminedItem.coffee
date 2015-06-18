Template.addExaminedItem.helpers
  addExaminedItemSchema:->
    Schema.ExaminedItems
  'item_id':->
    new Meteor.Collection.ObjectID()._str
Template.addExaminedItem.events 'click #insertEIBut':(e) ->
  e.preventDefault()
  doc = AutoForm.getFormValues('insertExaminedItemForm').insertDoc
  console.log(doc)
  console.log(this)
  dep = Departments.findOne this.dep_id
  Departments.update({_id:this.dep_id},{$set:{name:dep.name},$push:{'examined_items':doc}})
  $("#addExaminedItemModal").modal 'hide'