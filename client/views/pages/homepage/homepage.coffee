#格式化时间，用于所有模板
Template.registerHelper 'ageFormat',(age)->
   moment(age).format('YYYY/MM/DD')

Template.registerHelper 'currentUser',->
   Meteor.user()





