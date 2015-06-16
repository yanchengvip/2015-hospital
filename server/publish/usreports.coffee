Meteor.publish 'usreports',->
  Laniakea.Collection.USReports.find()