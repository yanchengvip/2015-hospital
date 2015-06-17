Template.nurseProfile.events
  'click #updateNurseProfile':->
    $('#updateNurseModal').modal true

  'click #deleteNurse':(e)->
    e.preventDefault()
    if confirm "删除此护士"
      currentUserId = this._id
      Meteor.users.remove currentUserId
      Router.go("/departments/"+ this.department_id+"/show")

AutoForm.hooks
  editNurseForm:
    onSubmit:(insertDoc, updateDoc, currentDoc)->
      $('#updateNurseModal').modal 'hide'
    onSuccess:->
      $('#updateNurseModal').modal 'hide'