AutoForm.hooks
  insertNurseForm:
    onError: (operation, error)->
      console.log("添加失败" + error)
    onSuccess: ->
      console.log("onSuccess" )
      $("#addNurseModal").modal 'hide'
    onSubmit:(insertDoc,updateDoc,currentDoc)->
      console.log("onSubmit" )
