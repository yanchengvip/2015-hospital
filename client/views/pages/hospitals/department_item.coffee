Template.departmentItem.events 'click .delete': (e) ->
  e.preventDefault()
  if confirm('Delete this department?')
    currentDepId = @_id
    Meteor.call('removeDepData', currentDepId);
    #    Hospitals.remove currentHosId
#    Router.go '/hospitals'
  return