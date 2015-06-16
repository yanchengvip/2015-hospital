Meteor.subscribe('users')
Template.doctorList.helpers
  'doctorList':->
    Meteor.users.find({roles:'doctor'})

Template.doctorList.events
  'submit #insertDoctorForm':(e)->
    e.preventDefault()
