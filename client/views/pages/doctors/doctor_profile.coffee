Template.doctorProfile.events
  'click #updateDoctorProfile':->
    $('#updateDoctorModal').modal true

   'click #deleteDoctor':(e)->
     e.preventDefault()
     if confirm "删除此医生"
       currentUserId = this._id
       Meteor.users.remove currentUserId
       Router.go("/departments/"+ this.department_id+"/show")

AutoForm.hooks
  editDoctorForm:
    onSubmit:(insertDoc, updateDoc, currentDoc)->
      $('#updateDoctorModal').modal 'hide'
    onSuccess:->
      $('#updateDoctorModal').modal 'hide'