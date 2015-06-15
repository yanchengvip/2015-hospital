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
  modality:
    type:String
    label:'模式'
  operation_frequence:
    type:String
    label:'此机器每小时检查人次频率'

Schema.ExaminedPositions = new SimpleSchema
  position:
    type:String
    label:'检查部位'

Schema.ExaminedItems = new SimpleSchema
  position:
    type:String
    label:'检查部位'
  fee:
    type:String
    label:'费用'
  time_length:
    type:Number
    label:'检查时间长度'
  检查部位:
    type: [Object]
    optional: true
  "检查部位.$":
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


  诊室设备信息:
    type:[Object]
    optional:true
  "诊室设备信息.$":
    type: Schema.ModalityDevices
    optional: true

  检查项目:
    type:[Object]
    optional:true
  "检查项目.$":
    type: Schema.ExaminedItems
    optional: true

  description:
    type: String
    label: "描述"
    min: 20,
    max: 1000,
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