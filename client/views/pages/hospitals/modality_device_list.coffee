#Template.ModalityDeviceList.helpers
#  'device_id':->
#    new Meteor.Collection.ObjectID()._str
#    console.log(ObjectId())
Template.ModalityDeviceList.events
  'click #editModalityDeviceDiv':(e)->
    e.preventDefault()
    $('#id_id').val(this._id)
    $('#dep_id').val(this.dep_id)
    $('#devices_name_id').val(this.devices_name)
    $('#modality_id').val(this.modality)
    $('#operation_frequence_id').val(this.operation_frequence)
    $("#editModalityDeviceModal").modal 'show'
Template.ModalityDeviceList.events 'click #delModalityDevice':(e)->
  e.preventDefault()
  console.log(this)
  if confirm('确定删除该检查设备信息吗?')
    dep = Departments.findOne this.dep_id
    doc = this
    Departments.update({_id:this.dep_id},{$set:{name:dep.name},$pull:{modality_devices:doc}})

