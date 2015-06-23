Template.ExaminedItemList.events
  'click #editExaminedItemDiv':(e)->
    e.preventDefault()
    $('#item_id').val(this._id)
    $('#dep_id').val(this.dep_id)
    $('#position_id').val(this.position)
    $('#fee_id').val(this.fee)
    $('#time_length_id').val(this.time_length)
    positions = this.examined_positions
    pos_names = []
    i=0
    while i < positions.length
      console.log()
#      $('input[name=\'examined_positions.'+i+'.position_name\']')[0].val(positions[i].position_name)
      console.log(positions[i].position_name)
      pos_names.push(positions[i].position_name)
      i++
#    $('#examined_positions_id').val(this.examined_positions)
    $('#examined_positions_id').val(pos_names)
    $("#editExaminedItemModal").modal 'show'

Template.ExaminedItemList.events 'click #delExaminedItem':(e)->
  e.preventDefault()
  if confirm('确定删除该检查项目信息吗?')
    dep = Departments.findOne this.dep_id
    doc = this
    Departments.update({_id:this.dep_id},{$set:{name:dep.name},$pull:{examined_items:doc}})
