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
Laniakea.Collection.USReports.allow
  'insert':->
    true
