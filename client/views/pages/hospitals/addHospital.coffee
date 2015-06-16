AutoForm.hooks
  insertHospitalForm:
    onError: (operation, error)->
      console.log("添加失败" + error)
    onSuccess: ->
      console.log("onSuccess" )
      #      if Departments.insert(dep)
      #        Hospitals.update( {_id: dep.hospital_id,},
      #        {$inc: {department: 1} });
      $("#addHospitalModal").modal 'hide'
    onSubmit:(doc)->
#      this.done();
#      console.log(doc.hospital_id )
#      console.log("onSubmit" )
    after: insert:(error,result)->
      console.log(result)
