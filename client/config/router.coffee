Router.configure
  layoutTemplate: 'mainLayout'
  notFoundTemplate: 'notFound'
#
# Example pages routes
#
Router.route '/posts',
  name:'posts'
  subscriptions:->
    Meteor.subscribe 'posts'
Router.route '/pageTwo', ->
  @render 'pageTwo'
Router.route '/', ->
  Router.go 'posts'

Router.route '/patients',
  name : 'patients'
  waitOn:->
    Meteor.subscribe 'patients',{},{}
