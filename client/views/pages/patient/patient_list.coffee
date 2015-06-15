Meteor.subscribe('users');

Template.patientList.helpers
  'patientList': ->
#    Meteor.users.find();
    Meteor.users.search(Session.get('queryPatPara'))

Template.patientList.events
  'submit form':(e)->
    e.preventDefault()
    queryPatPara=$(e.target).find('[name=patientListQueryPara]').val()
#    reg = new RegExp('11', 'i')
#    Meteor.users.find({$or:[{name: reg},{spell_code:reg}]},{fields:{name:1}})
    console.log(queryPatPara)
    Session.set('queryPatPara', queryPatPara)


