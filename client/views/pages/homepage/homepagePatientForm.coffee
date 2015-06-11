

Template.homepagePatientForm.events
  'submit form':(e)->
    e.preventDefault()

    user =
       name:$(e.target).find('[name=name]').val()
       age:$(e.target).find('[name=age]').val()
       disease_type:$(e.target).find('[name=disease_type]').val()
       mobile:$(e.target).find('[name=mobile]').val()
       hospital:$(e.target).find('[name=hospital]').val()
       department:$(e.target).find('[name=department]').val()
       roles:['patient']

    user._id=Meteor.users.insert user
    Router.go '/'

