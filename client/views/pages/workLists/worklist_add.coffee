AutoForm.hooks
  addWorkListForm:
    onError: (operation, error)->
      console.log error
    onSuccess:->
      $('#addWorkListModal').modal('hide');