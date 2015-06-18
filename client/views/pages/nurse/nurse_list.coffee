Meteor.subscribe('users')
Template.nurseList.helpers
  'nurseListData':->
    Meteor.users.find({'profile.userProfile.roles':'nurse','profile.userProfile.department_id':this["dept_id"]})

Template.nurseList.events
  'submit #insertNurseForm':(e)->
    e.preventDefault()



