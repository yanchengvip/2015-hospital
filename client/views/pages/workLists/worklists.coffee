Meteor.subscribe 'WorkLists'
Template.worklists.onCreated ->
  Session.set('queryWltPara', {})
#时间格式化
Template.registerHelper 'formatDate', (date) ->
  moment(date).format 'YYYY-MM-DD'

Template.worklists.helpers
  worklists: ->
    WorkLists.search(Session.get('queryWltPara'))
Template.worklists.events
  'input [id=pName]':(e)->
    e.preventDefault();
    searchWlS()
  'change #startTime':(e)->
    e.preventDefault();
    searchWlS()
  'change #endTime':(e)->
    e.preventDefault();
    searchWlS()
  'click #search_clear':(e)->
    e.preventDefault();
    $('#pName').val()
    $('#startTime').val()
    $('#endTime').val()
    Session.set('queryWltPara', {})

searchWlS = ->
  pName = $('#pName').val()
  startTime = $('#startTime').val()
  endTime = $('#endTime').val()
  str = {}
  if pName
    str['pn'] = pName
  if startTime
    str['startTime'] = startTime
  if endTime
    str['endTime'] = endTime
  Session.set('queryWltPara',str)











