Router.configure
  layoutTemplate : 'mainLayout'
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"
#
# Example pages routes
#
Router.route '/',
  name:'homepageMain'

Router.route "/showPatients",
  action: ->
    Router.go "/"

Router.route '/profile/:_id',
  name:'patientProfile'
  data:->
    Meteor.users.findOne this.params._id

Router.route('/hospitals')

