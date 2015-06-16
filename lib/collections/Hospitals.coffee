@Hospitals  = new Mongo.Collection "hospitals"

Schema = {}
Schema.Hospitals = new SimpleSchema

  name:
    type: String
    label: "医院名称"

  spell_code:
    type: String,
    label: ' ',#医院名称首字母缩写
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

#  spell_code:
#    type: String
#    label: "医院名称首字母缩写"

  short_name:
    type: String
    label: "医院简称"
    optional: true

  address:
    type: String
    label: "医院地址"
    optional: true

  phone:
    type:  String
    label: "联系电话"
    optional: true

  rank:
    type: String
    label: "医院等级"
    optional: true
    autoform:
      afFieldInput:
        firstOption:'请选择'
      allowedValues:['三级甲等','三级乙等','二级甲等','二级乙等','一级甲等','一级乙等']
      options:->
        三级甲等:'三级甲等',
        三级乙等:'三级乙等',
        二级甲等:'二级甲等',
        二级乙等:'二级乙等',
        一级甲等:'一级甲等',
        一级乙等:'一级乙等'


#  email:
#    type: String
#    label: "电子邮件"
#    regEx: SimpleSchema.RegEx.Email
#    autoform:
#      afFieldInput:
#        type: 'email'
#    optional: true

  department_count:
    type: Number
    label: " "
    autoform:
      afFieldInput:
        type:'hidden'
    autoValue:->
      if this.isInsert
        0
    optional: true

  doctor_count:
    type: Number
    label: " "
    autoform:
      afFieldInput:
        type:'hidden'
    autoValue:->
      if this.isInsert
        0
    optional: true

  description:
    type: String
    label: "描述"
#    min: 10,
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

Hospitals.attachSchema Schema.Hospitals