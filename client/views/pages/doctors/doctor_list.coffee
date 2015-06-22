Meteor.subscribe('users')
Template.doctorList.helpers
  'doctorListData':->
    Meteor.users.find({'profile.userProfile.roles':'doctor','profile.userProfile.department_id':this["dept_id"]})

Template.doctorList.events
  'submit #insertDoctorForm':(e)->
    e.preventDefault()



