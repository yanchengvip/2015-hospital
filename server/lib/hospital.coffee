Meteor.methods
  'addHospital': (hos) ->
    console.log(hos.name)
    return
  'insterDepartment': (dep) ->
#    console.log(this._id)
    console.log(dep.name)
    console.log(dep.hospital_id)
    if Departments.insert(dep)
      Hospitals.update( {_id: dep.hospital_id,},
        {$inc: {department: 1} });
    return

