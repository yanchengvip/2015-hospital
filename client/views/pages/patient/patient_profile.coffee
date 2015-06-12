Template.patientProfile.events
  'click #deletePatient':(e)->
    e.preventDefault()
    if confirm "删除此患者"
       currentUserId = this._id
       Meteor.users.remove currentUserId
       Router.go('/');

  'click #updatePatientProfile':(e)->
      $('#updatePatientModal').modal true

AutoForm.hooks
  editPatientForm:
    onSubmit:(insertDoc, updateDoc, currentDoc)->
      $('#updatePatientModal').modal 'hide'
    onSuccess:->
      $('#updatePatientModal').modal 'hide'
      console.log("onSuccess")

