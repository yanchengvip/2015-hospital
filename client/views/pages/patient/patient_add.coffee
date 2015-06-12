
AutoForm.hooks
  insertUserForm:
    onError: (operation, error)->
      console.log("添加失败" + error)
    onSuccess: ->
      console.log("onSuccess" )
      $("#addPatientModal").modal 'hide'
    onSubmit:(insertDoc,updateDoc,currentDoc)->
      console.log("onSubmit" )

#Template.homepagePatientForm.events
#  'submit form':(e)->
#    e.preventDefault()
#    doc = AutoForm.getFormValues(this.id).insertDoc
#    user =
#       username:$(e.target).find('[name=mobile]').val()
#       name:$(e.target).find('[name=name]').val()
#       age:$(e.target).find('[name=age]').val()
#       'profile.patientProfile.diseases_type':$(e.target).find('[name=disease_type]').val()
#       mobile:$(e.target).find('[name=mobile]').val()
#       hospital:$(e.target).find('[name=hospital]').val()
#       department:$(e.target).find('[name=department]').val()
#       roles:['patient']

#    Meteor.call 'userInsert',user,(error,result)->
#      if error
#        return alert(error.reason)
#      $("#addPatientModal").modal 'hide'
#
#      Router.go '/'
#      return


