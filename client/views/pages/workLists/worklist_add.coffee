Template.addWorkList.helpers s2Opts: ->
  [
    {
      label: 'Item 1'
      value: '1'
    }
    {
      label: 'Item 2'
      value: '2'
    }
    {
      label: 'Item 3'
      value: '3'
    }
    {
      label: 'Item 4'
      value: '4'
    }
    {
      label: 'Item 5'
      value: '5'
    }
  ]

AutoForm.hooks
  addWorkListForm:
    onError: (operation, error)->
      console.log error
    onSuccess:->
      $('#addWorkListModal').modal('hide');
