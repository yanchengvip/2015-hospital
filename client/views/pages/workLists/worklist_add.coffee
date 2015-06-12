AutoForm.hooks
  addWorkListForm:
    onError: (operation, error)->
      alert '操作失败！'
      console.log error
    onSuccess:->
      alert "操作成功！"
      $('#addWorkListModal').modal('hide');