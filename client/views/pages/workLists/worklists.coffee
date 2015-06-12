Meteor.subscribe('WorkLists');
Template.workLists.helpers worklists: ->
  WorkLists.find()