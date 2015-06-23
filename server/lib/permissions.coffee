Hospitals.allow
  insert:->
    true
  update:->
    true
Departments.allow
  insert:->
    true
  update:->
    true
WorkLists.allow
  insert: ->
    true
  remove: ->
    true
  update: ->
    true
Meteor.methods
  'removeHosData': (hos_id) ->
    Hospitals.remove
      _id: hos_id
    return
  'removeDepData': (dep_id) ->
    Departments.remove
      _id: dep_id
    return
Meteor.users.allow
  insert:->
    true
  remove:->
    true
  update:->
    true
Laniakea.Collection.UsReports.allow
  'insert':->
    true
Laniakea.Collection.UsReportImages.allow
  insert: (userId, doc) ->
    true
  update: (userId, doc, fieldNames, modifier) ->
    true
  download: (userId)->
    true
  remove: (userId, doc) ->
    true
