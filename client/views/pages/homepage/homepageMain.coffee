Meteor.subscribe('users');

Template.homepageMain.helpers
  'patientList': ->
     Meteor.users.find();





