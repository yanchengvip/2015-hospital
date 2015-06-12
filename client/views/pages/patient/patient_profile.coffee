Template.patientProfile.events
  'click #deletePatient':(e)->
    e.preventDefault()
    if confirm "删除此患者"
       currentUserId = this._id
       Meteor.users.remove currentUserId
       Router.go('/');
