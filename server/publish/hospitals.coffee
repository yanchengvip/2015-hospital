#publish
Meteor.publish 'hospitals',->
  Hospitals.find()

