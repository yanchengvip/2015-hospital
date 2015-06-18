@Departments  = new Mongo.Collection "departments"
@ModalityDevices  = new Meteor.Collection "ModalityDevices"
@ExaminedItems  = new Meteor.Collection "ExaminedItems"

Schema = {}
Schema.ModalityDevices = new SimpleSchema
#  station_name:
#    type:String
#    label:'诊室对应名称'
#  station_aet:
#    type:String
#    label:'诊室对应主键'
  dep_id:
    type:String

  devices_name:
    type:String
    label:"设备名称"
  modality:
    type:String
    label:'模式'
    autoform:
      afFieldInput:
        firstOption:'请选择'
      allowedValues:['CT','超声','MR','报告']
      options:->
        CT:'CT',
        超声:'超声',
        MR:'MR',
        报告:'报告'
  operation_frequence:
    type:String
    label:'此机器每小时检查人次频率'

Schema.ExaminedPositions = new SimpleSchema
  position_name:
    type:String
    label:'检查部位'

Schema.ExaminedItems = new SimpleSchema
  dep_id:
    type:String

  position:
    type:String
    label:'检查部位'
  fee:
    type:String
    label:'费用'
  time_length:
    type:Number
    label:'检查时间长度'
  examined_positions:
    type: [Object]
    optional: true
#    label:'详细检查部位'
  "examined_positions.$":
    type: Schema.ExaminedPositions
    optional: true

Schema.Departments = new SimpleSchema

  name:
    type: String
    label: "科室名称"
  spell_code:
    type: String,
    label: ' ',#科室名称首字母缩写
    optional: true,
    autoform:
      afFieldInput:
        type:'hidden'
    autoValue:->
      t = PinYin(this.field('name').value)
      if t&&t.length>0
        return t[0]
      else
        return ''

  short_name:
    type: String
    label: "科室简称"

  phone:
    type:String
    label:'联系电话'

  hospital_id:
    type:String
    label:'医院关联'

  department_type:
    type:String
    label:'科室类型'
    autoform:
      afFieldInput:
        firstOption:'请选择科室类型'
      allowedValues:['内科','外科','医级科室','小儿科']
      options:->
        内科:'内科',
        外科:'外科',
        医级科室:'医级科室',
        小儿科:'小儿科'


  modality_devices:
    type:[Object]
    optional:true
#    label:'检查设备'
  "modality_devices.$":
    type: Schema.ModalityDevices
    optional: true

  examined_items:
    type:[Object]
    optional:true
#    label:'检查项目'
  "examined_items.$":
    type: Schema.ExaminedItems
    optional: true

  description:
    type: String
    label: "描述"
#    min: 20,
#    max: 1000,
    autoform:
      rows: 5
    optional: true

  createdAt:
    type: Date
    autoValue: ->
      if @isInsert
        new Date
      else if @isUpsert
        $setOnInsert: new Date
      else
        @unset()
    autoform:
      omit: true

Departments.attachSchema Schema.Departments
ModalityDevices.attachSchema Schema.ModalityDevices
ExaminedItems.attachSchema Schema.ExaminedItems