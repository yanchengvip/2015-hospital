Template.ExaminedItemList.events
  'click #editExaminedItemDiv':(e)->
    e.preventDefault()
#    $('#id_id').val(this._id)
#    $('#dep_id').val(this.dep_id)
#    $('#devices_name_id').val(this.devices_name)
#    $('#modality_id').val(this.modality)
#    $('#operation_frequence_id').val(this.operation_frequence)
#    $("#editExaminedItemModal").modal 'show'
Template.ExaminedItemList.events 'click #delExaminedItem':(e)->
  e.preventDefault()
  console.log(this._id)
  if confirm('确定删除该检查项目信息吗?')
    dep = Departments.findOne this.dep_id
    doc = this
    Departments.update({_id:this.dep_id},{$set:{name:dep.name},$pull:{examined_items:doc}})
    console.log(this.dep_id)
#    Meteor.call('removeDepData', currentDepId);
