#publish
Meteor.publish 'hospitals',->
  Hospitals.find()

Meteor.publish 'singleHospital', (id) ->
  Hospitals.find id

Meteor.publish 'departments',->
  Departments.find()

Meteor.publish 'subDepartments',(hos_id)->
  Departments.find({hospital_id:hos_id})

Meteor.publish 'singleDepartment',(id)->
  Departments.find id
