Meteor.publish "WorkLists",->
  WorkLists.find();

Meteor.publish "AllWorkLists", (dp_id) ->
  check dp_id, String
  WorkLists.find yydp: dp_id

#Meteor.methods
#  'searchWorklists': (pMsg, startTime, endTime) ->
#    reg = new RegExp(pMsg, 'i')
#    return WorkLists.find({pn: reg, yyTime:{$gte:startTime,$lte:endTime}})


