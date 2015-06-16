Template.hospitalItem.events 'click .delete': (e) ->
  e.preventDefault()
  if confirm('确定删除该医院吗?')
    currentHosId = @_id
    Meteor.call('removeHosData', currentHosId);
#    Hospitals.remove currentHosId
    Router.go '/hospitals'
  return