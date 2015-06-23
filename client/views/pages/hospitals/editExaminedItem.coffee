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
Template.editExaminedItem.helpers
  editExaminedItemSchema:->
    Schema.ExaminedItems
#  examinedPositionSchema:->
#    Schema.ExaminedPositions
#  'examinedItem':->
#    console.log(@params)
##    doc = AutoForm.getFormValues('updateExaminedItemForm').insertDoc
##    doc._id
#    dep = Departments.findOne this.dep_id
#    items = dep.examined_items
#    i = 0
#    l = items.length
#    new_items=[]
#    while i < l
#      console.log(items[i].examined_positions)
##      if items[i]._id==doc._id
##        new_items.push(doc)
#      i++
#    return new_items
Template.editExaminedItem.events 'click #updateEIBut':(e) ->
  e.preventDefault()
  doc = AutoForm.getFormValues('updateExaminedItemForm').insertDoc
  console.log(doc)
#  pos = doc.examined_positions.split(',')
#  console.log(pos)
#  lg = pos.length
#  j = 0
#  ep_arr = []
#  while j < lg
#    console.log(j)
#    ep = new Schema.ExaminedPositions
#    console.log(pos[j])
#    ep.position_name = pos[j]
#    ep_arr.push(ep)
#    j++
#  console.log(ep_arr)
#  doc.examined_positions = ep_arr
  console.log(this)
  dep = Departments.findOne this.dep_id
  items = dep.examined_items
  i = 0
  l = items.length
  new_items=[]
  while i < l
    if items[i]._id==doc._id

      new_items.push(doc)
    else
      new_items.push(items[i])
    i++
  Departments.update({_id:this.dep_id},{$set:{name:dep.name,'examined_items':new_items}})
  $("#editExaminedItemModal").modal 'hide'
