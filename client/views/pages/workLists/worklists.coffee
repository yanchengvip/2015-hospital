Meteor.subscribe 'WorkLists'
Meteor.subscribe 'SearchWLS'

Template.worklists.onCreated ->
  Session.set('queryWltPara', {})
#时间格式化
Template.registerHelper 'formatDate', (date) ->
  moment(date).format 'YYYY-MM-DD HH:mm'

Template.worklists.helpers worklists: ->
  WorkLists.search(Session.get('queryWltPara'))
Template.worklists.events
  'input [type=text]':(e)->
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
  time = {}
  if startTime
    time['$gte'] = startTime
  if endTime
    time['$lte'] = endTime
  if startTime or endTime
    str['yyTime'] = time
  Session.set('queryWltPara',str)











