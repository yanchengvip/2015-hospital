Meteor.subscribe('users')
Template.nurseList.helpers
  'nurseListData':->
    Meteor.users.find({roles:'nurse',department_id:this["dept_id"]})

Template.nurseList.events
  'submit #insertNurseForm':(e)->
    e.preventDefault()



