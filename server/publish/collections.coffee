Meteor.publish 'patients',(search,options)->
  Patients.find(search,options,{})