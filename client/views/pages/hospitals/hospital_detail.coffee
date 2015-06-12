Template.showHospitals.helpers
  'departments': ->
    return Departments.find({hospital_id: this._id});
#    console.log(this._id)
