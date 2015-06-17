Meteor.subscribe('users')
Template.doctorList.helpers
  'doctorListData':->
    Meteor.users.find({roles:'doctor',department_id:this["dept_id"]})

Template.doctorList.events
  'submit #insertDoctorForm':(e)->
    e.preventDefault()



