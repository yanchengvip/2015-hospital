Router.configure
  layoutTemplate : 'mainLayout'
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"
#
# Example pages routes
#
#登录后首页
Router.route '/',
  name:'homepageMain'

#判断是否登录
isLogin = ->
  if !Meteor.userId()
    Session.set 'username', ''
    @layout 'homeLayout'
    @render 'home'
  else
    @next()

#  登录之前调用
Router.onBeforeAction isLogin,
  except:[
    'login','home'
  ]

##登录
Router.route '/login',
  layoutTemplate:'blankLayout'
  name:'login'
  action: ->
    if !Meteor.userId()
      @layout 'blankLayout'
      @render 'login'
    else
      Router.go "/"

#退出
Router.route '/logout',
  action: ->
    Meteor.logout (err) ->
      unless err
        Router.go '/'


Router.route "/showPatients",
  action: ->
    Session.set('queryPatPara', '')
    Router.go "/homepageMain"

#查找
Router.route '/profile/:_id',
  name:'patientProfile'
  data:->
    Meteor.users.findOne this.params._id
#显示医生
Router.route 'doc_profile/:_id',
  name:'doctorProfile'
  data:->
    Meteor.users.findOne this.params._id
#修改
Router.route 'profile/:_id/edit',
  name:'editPatient'
  data:->
    Meteor.findOne this.params._id

#显示护士
Router.route 'nurseProfile/:_id',
  name:'nurseProfile'
  data:->
    Meteor.users.findOne this.params._id

Router.route '/my_profile',
  action:->
    console.log 2222
    console.log Meteor.user()
    currentUser=Meteor.user()
    if currentUser.profile.userProfile.roles[0]=='doctor'
      Router.go '/doc_profile/'+currentUser._id
    else if currentUser.profile.userProfile.roles[0]=='nurse'
      Router.go '/nurseProfile/'+currentUser._id
    else
      false

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
      Meteor.subscribe 'WorkLists'
      Meteor.subscribe 'usReports'
      Meteor.subscribe 'usReportImages'
    ]
