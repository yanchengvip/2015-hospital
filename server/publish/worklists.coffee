Meteor.publish "WorkLists",->
  WorkLists.find();

Meteor.publish "AllWorkLists", (dp_id) ->
  check dp_id, String
  WorkLists.find yydp: dp_id


