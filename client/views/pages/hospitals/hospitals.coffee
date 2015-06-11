Meteor.subscribe('hospitals');
Template.hospitals.helpers
  'hospital': ->
    return Hospitals.find()

