Template.hospitalItem.events 'click .delete': (e) ->
  e.preventDefault()
  if confirm('Delete this hospital?')
    currentHosId = @_id
    Meteor.call('removeHosData', currentHosId);
#    Hospitals.remove currentHosId
    Router.go '/hospitals'
  return