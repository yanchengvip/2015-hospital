Template.showDepartments.events 'click #delExaminedItem':(e)->
  e.preventDefault()
  console.log(this._id)
  if confirm('确定删除该检查项目信息吗?')
    dep = Departments.findOne this.dep_id
    doc = this
    Departments.update({_id:this.dep_id},{$set:{name:dep.name},$pull:{examined_items:doc}})
    console.log(this.dep_id)
#    Meteor.call('removeDepData', currentDepId);

Template.showDepartments.events 'click #delModalityDevice':(e)->
  e.preventDefault()
  if confirm('确定删除该检查设备信息吗?')
    dep = Departments.findOne this.dep_id
    doc = this
    Departments.update({_id:this.dep_id},{$set:{name:dep.name},$pull:{modality_devices:doc}})
    console.log(this.dep_id)
#    Hospitals.update({_id:this.hospital_id},{$inc:{department_count:-1}})
    console.log(this)
#    Meteor.call('removeDepData', currentDepId);
