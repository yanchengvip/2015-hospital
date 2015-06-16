Template.departmentItem.events 'click .delete': (e) ->
  e.preventDefault()
  if confirm('确定删除该科室吗?')
    Hospitals.update({_id:this.hospital_id},{$inc:{department_count:-1}})
    currentDepId = @_id
    Meteor.call('removeDepData', currentDepId);
    #    Hospitals.remove currentHosId
#    Router.go '/hospitals'
  return