Template.addWorkList.helpers patients: ->
  Meteor.users.find()
#Template.addWorkList.onCreated ->
#  Session.set('queryPname', '***')
Template.addWorkList.events
  'input [name=pn]':(e)->
    e.preventDefault();
    pn = $('#search_pn').val()
    Session.set('queryPname', pn)
AutoForm.hooks
  addWorkListForm:
    onError: (operation, error)->
    onSuccess:->
      $('#addWorkListModal').modal('hide');
