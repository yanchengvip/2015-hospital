@WorkLists = new Mongo.Collection ("worklists")

Schema = {}

Schema.workList = new SimpleSchema
  pID:
    type: String
    label: '患者编号'
    optional: true

  pn:
    type: String
    label: "患者姓名"
    optional: true

  psc:
    type: String,
    label: '姓名编码'
    optional: true
    autoform:
      afFieldInput:
        type:'hidden'
    autoValue:->
      t = PinYin(this.field('pn').value)
      if t&&t.length>0
        return t[0]
      else
        return ''

  pg:
    type: String
    label: "性别"
    optional: true
    autoform:
      type: 'select-radio-inline'
      options: ->
        男: '男',
        女: '女'
      noselect: true

  pa:
    type: Number
    label: "患者年龄"

  yyTime:
    type: Date
    label: "预约时间"
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          format: "yyyy-mm-dd"

  yydp:
    type: String
    label: "预约科室"

  yyd:
    type:  String
    label: "预约医生"

  jcbw:
    type: String
    label: "检查部位"

  jcxm:
    type: String
    label: "检查项目"

  state:
    type: Number
    label: '状态'
    autoValue: ->
      if this.isInsert
        0
    autoform:
      omit: true

  note:
    type: String
    label: "备注"
    optional: true
    autoform:
      omit: true

  created_at:
    type: Date,
    autoValue: ->
      if this.isInsert
        new Date()
    autoform:
      omit: true

  updated_at:
    type: Date,
    optional: true,
    autoValue: ->
      if this.isUpdate
        new Date()
    autoform:
      omit: true


WorkLists.attachSchema Schema.workList

WorkLists.search = (query)->
  str = {}
  if query.pn
    query.pn = RegExp(query.pn, 'i')
    str['$or'] = [{pn: query.pn},{psc:query.pn}]
  time = {}
  if query.startTime
    time['$gte'] = query.startTime
  if query.endTime
    time['$lte'] = query.endTime
  if query.startTime or query.endTime
    str['yyTime'] = time
  console.log str
  return  WorkLists.find(str);
