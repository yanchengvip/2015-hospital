AutoForm.hooks
  insertDoctorForm:
    onError: (operation, error)->
      console.log("添加失败" + error)
    onSuccess: ->
      console.log("onSuccess" )
      $("#addDoctorModal").modal 'hide'
    onSubmit:(insertDoc,updateDoc,currentDoc)->
      console.log("onSubmit" )
