Meteor.subscribe 'WorkLists'
Template.worklists_r.onCreated ->
  Session.set('queryWltPara', {})
#时间格式化
Template.registerHelper 'formatDate', (date) ->
  moment(date).format 'YYYY-MM-DD'

Template.worklists_r.helpers
  worklists_yy: ->
    WorkLists.find({state: '患者预约'})




