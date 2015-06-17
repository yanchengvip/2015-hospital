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
    Session.set('queryPatPara', '')
    Router.go "/"

#查找
Router.route '/profile/:_id',
  name:'patientProfile'
  data:->
    Meteor.users.findOne this.params._id
#查询医生
Router.route 'doc_profile/:_id',
  name:'doctorProfile'
  data:->
    Meteor.users.findOne this.params._id

#查询医生
Router.route 'nurse_profile/:_id',
  name:'nurseProfile'
  data:->
    Meteor.users.findOne this.params._id
#修改
Router.route 'profile/:_id/edit',
  name:'editPatient'
  data:->
    Meteor.findOne this.params._id

Router.route('/hospitals')


Router.route '/hospitals/:_id/show',
  name: 'showHospitals'
  waitOn: ->
    [
      Meteor.subscribe 'singleHospital', @params._id
      Meteor.subscribe 'subDepartments', @params._id
    ]
  data: ->
    Hospitals.findOne @params._id
Router.route '/departments/:_id/show',
  name:'showDepartments'
  waitOn:->
    Meteor.subscribe 'singleDepartment', @params._id
  data:->
    Departments.findOne @params._id

Router.route '/worklists'
Router.route '/submit', name: 'addWorkList'

Router.route 'usreports',
  name:'usreports',
  waitOn: ->
    [
      Meteor.subscribe 'usreports'
    ]
