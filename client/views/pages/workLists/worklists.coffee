Meteor.subscribe('WorkLists');

#时间格式化
Template.registerHelper 'formatDate', (date) ->
  moment(date).format 'YYYY-MM-DD HH:mm'

Template.worklists.helpers worklists: ->
  WorkLists.find()