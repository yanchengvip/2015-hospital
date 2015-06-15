Template.showHospitals.helpers
  'departments': ->
    return Departments.find({hospital_id: this._id});
#    console.log(this._id)

Template.addDepartment.events 'click #insertbutton': (e) ->
#  e.preventDefault()
#  if confirm('Delete this hospital?')
  console.log(this._id)
  currentHosId = @_id
  console.log(currentHosId)
#    Router.go '/hospitals'
#  return

AutoForm.hooks
  insertDepForm:
    before: insert: (doc) ->
      # Potentially alter the doc
      doc.department_type = 'bar'
      console.log(doc.name)
#      console.log(this._id)
      # Then return it or pass it to this.result()
#          return doc; #(synchronous)
      #return false; (synchronous, cancel)
      #this.result(doc); (asynchronous)
#      this.result(false); #(asynchronous, cancel)
#      return
    onSubmit:(insertDoc, updateDoc, currentDoc)->
#    $('#updatePatientModal').modal 'hide'
    onSuccess:->
#    $('#updatePatientModal').modal 'hide'
      console.log("onSuccess")

hooksObject =
  before: insert: (doc) ->
    # Potentially alter the doc
    doc.department_type = 'bar'
    console.log(doc.name)
    console.log(this._id)
    # Then return it or pass it to this.result()
    #    return doc; #(synchronous)
    #return false; (synchronous, cancel)
    #this.result(doc); (asynchronous)
    #this.result(false); (asynchronous, cancel)
    return
  after: insert: (error, result) ->
  onSubmit: (insertDoc, updateDoc, currentDoc) ->

    console.log(currentDoc.name)
    console.log(this._id)
    # You must call this.done()!
    #this.done(); // submitted successfully, call onSuccess
    #this.done(new Error('foo')); // failed to submit, call onError with the provided error
    #this.done(null, "foo"); // submitted successfully, call onSuccess with `result` arg set to "foo"
    return
  onSuccess: (formType, result) ->
  onError: (formType, error) ->
  formToDoc: (doc) ->
    # alter doc
    # return doc;
    return
  formToModifier: (modifier) ->
    # alter modifier
    # return modifier;
    return
  docToForm: (doc, ss) ->
  beginSubmit: ->
  endSubmit: ->

