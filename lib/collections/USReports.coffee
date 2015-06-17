@Laniakea.Collection.USReportImages = new FS.Collection('usreportImages',
  stores: [
    new FS.Store.FileSystem('usreportImages', path: '/opt/webus'),
    new FS.Store.FileSystem('usreportThumbs',
      transformWrite: (fileObj, readStream, writeStream) ->
        gm(readStream).resize(60).stream().pipe(writeStream)
    )
  ]
)
@Laniakea.Collection.USReports = new Mongo.Collection "usreports"
Schema = {}

Schema.USReport = new SimpleSchema(
  patient_id:
    type:String
    label:'患者ID'
    optional:true
  patient_name:
    type:String
    label:'患者'
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
  report_content:
    type:String
    label:'报告内容'
)

@Laniakea.Collection.USReports.attachSchema Schema.USReport

