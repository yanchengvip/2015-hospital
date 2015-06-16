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

  jcbu:
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
  if query.pn
    query.pn = RegExp(query.pn, 'i')
  return  WorkLists.find(query);

@SearchWLS = new Mongo.Collection null
Schema_search = {}

Schema_search.searchPara = new SimpleSchema
  startTime:
    type: Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          format: "yyyy-mm-dd"
  endTime:
    type: Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          format: "yyyy-mm-dd"
SearchWLS.attachSchema Schema_search.searchPara