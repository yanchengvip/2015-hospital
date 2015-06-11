Router.configure
  layoutTemplate : 'mainLayout'
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"
#
# Example pages routes
#
Router.route '/',
  name:'homepageMain'

Router.route('/hospitals')