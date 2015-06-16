@Laniakea.Collection.USReports = new Mongo.Collection "usreports"
Schema = {}

Schema.USReport = new SimpleSchema(
  patient_id:
    type:String
    label:'患者ID'
    optional:true
  patient_name:
    type:String
    label:'患者名字'
    optional:true
  examine_doctor_id:
    type:String
    label:'检查医生ID'
    optional:true
  examine_doctor_name:
    type:String
    label:'检查医生'
    optional:true
  image_list:
    type:[String]
    optional:true
  us_finding:
    type:String
    label:'超声所见'
  us_diagnose:
    type:String
    label:'超声所得'
)

@Laniakea.Collection.USReports.attachSchema Schema.USReport

