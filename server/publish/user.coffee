###
Meteor.publish "user",->
  Meteor.users.find {_id:@userId},
    limit:1
    fields:
      profile:1###

Meteor.publish "users",->
  Meteor.users.find();

Meteor.publish "user",->
  Meteor.users.find {_id:@userId},
    limit:1
    fields:
      profile:1
