# Schemas for Meteor.users collection
# Roles: admin | doctor | patient

Schema = {}

# -----------------------   管理员 profile  -----------------------------
Schema.AdminProfile = new SimpleSchema()

# -----------------------   医生 profile  -----------------------------
Schema.DoctorProfile = new SimpleSchema(

  name:
    type: String
    label: "医生姓名"

  gender:
    type: String
    label: "医生性别"

  mobile:
    type: Number
    label: "医生手机号码"

  cardNo:
    type: Number
    label: "医生卡号"

  joinedAt:
    type: Date
    label: "医生入会时间"

  picture:
    type:  String
    label: "医生头像"
    regEx: SimpleSchema.RegEx.Url
    optional: true
    autoform:
      omit: true

  alertCheckTime:
    type: Date
    label: "上一次查看 alert 时间"
    optional: true
    autoform:
      omit: true
#autoValue: ->
#if @isInsert
#new Date

  messageCheckTime:
    type: Date
    label: "上一次查看 message 时间"
    optional: true
    autoform:
      omit: true
#autoValue: ->
#if @isInsert
#new Date

  patientList:
    type: [ String ]
    label: "客户名单"
    optional: true
    autoform:
      omit: true

  patientVipList:
    type: [ String ]
    label: "Vip 客户名单"
    optional: true
    autoform:
      omit: true
)

#---------------  用户上传头像 -----------------
#@OasisPD.Collection.Images = new FS.Collection("images",
#stores: [ new FS.Store.GridFS("images", {}) ]
#)

# -----------------------   病人 profile  -----------------------------
Schema.PatientProfile = new SimpleSchema(

  name:
    type: String
    label: "姓名"
  age:
    type: Number
    label: "年龄"
    optional: true
  gender:
    type: String
    label: "性别"
    optional: true
    autoform:
      type: 'select-radio-inline'
      options: ->
        男: '男',
        女: '女'
      noselect: true

  mobile:
    type: String
    label: "手机"
    regEx: /1[0-9]{10}/

  cardNo:
    type: String
    label: "健康卡号"
    regEx :/\d+/

  joinedAt:
    type: Date
    label: "病人入会时间"

  doctorId:
    type: [ String ]
    label: "责任医生"
    minCount: 1

  picture:
    type: String
    label: "病人头像"
#    regEx: SimpleSchema.RegEx.Url
    optional: true

  mainIssue:
    type: String
    label: "健康描述"
    optional: true
#    min: 20,
    max: 1000,
    autoform: {
      rows: 6
    }
)


# -----------------------  Schema for Meteor users  -----------------------------
Schema.User = new SimpleSchema(
  username:
    type: String
    regEx: /^[a-z0-9A-Z_@.]{1,15}$/
    label: "用户名"
#    defaultValue: "doc2"

  password:
    type: String
    label: "密码"
    optional: true
#    defaultValue: "123123"

  confirmPassword:
    type: String
    label: "密码确认"
    optional: true
    custom: ->
      if @value isnt @field("password").value
        "密码不一致"
#    defaultValue: "123123"

  emails:
    type: [Object]

# this must be optional if you also use other login services like facebook,
# but if you use only accounts-password, then it can be required
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

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

  services:
    type: Object
    optional: true
    blackbox: true

# 身份：admin | doctor | patient, can ONLY be one
  roles:
    type: [ String ]
    label: "身份（admin | doctor | patient）"
    allowedValues: [ "admin", "doctor", "patient" ]
    optional: true

  profile:
    type: Object
    optional: true

  "profile.adminProfile":
    type: Schema.AdminProfile
    optional: true

  "profile.doctorProfile":
    type: Schema.DoctorProfile
    optional: true

  "profile.patientProfile":
    type: Schema.PatientProfile
    optional: true
)


Meteor.users.attachSchema Schema.User

# -----------------------------
# 临时开的权限，用来在客户端注入假数据
# 以后需要更改
# -----------------------------
#Meteor.users.allow
#  insert: (userId) ->
#    true
#  update: (userId) ->
#    true