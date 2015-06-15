AutoForm.hooks
  insertDepartmentForm:
    onError: (operation, error)->
      console.log("添加失败" + error)
    onSuccess: ->
      console.log("onSuccess" )
#      if Departments.insert(dep)
#        Hospitals.update( {_id: dep.hospital_id,},
#        {$inc: {department: 1} });
      $("#addDepartmentModal").modal 'hide'
    onSubmit:(doc)->
#      this.done();
      console.log(doc.hospital_id )
      console.log("onSubmit" )
    after: insert:(error,result)->
      console.log(result)

Template.addDepartment.helpers
  'DepartmentsFormSchema':->
    return Departments
#Template.addDepartment.events 'click #insertbutton': (e) ->
##  e.preventDefault()
##  if confirm('Delete this hospital?')
#    currentHosId = @hos_id
#    console.log(currentHosId)
##    Meteor.call('removeHosData', currentHosId);
#    #    Hospitals.remove currentHosId
##    Router.go '/hospitals'
##  return