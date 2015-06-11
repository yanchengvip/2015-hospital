# Schemas for Meteor.users collection
# Roles: admin | doctor | patient
#Users.allow
#  insert:(_id)



Schema = {}

# -----------------------   管理员 profile  -----------------------------
Schema.AdminProfile = new SimpleSchema()

# -----------------------   医生 profile  -----------------------------
Schema.DoctorProfile = new SimpleSchema(
  hospital:
    type: String
    label:"所在医院"
  department:
    type: String
    label: "所在科室"
)

#---------------  用户上传头像 -----------------
#@OasisPD.Collection.Images = new FS.Collection("images",
#stores: [ new FS.Store.GridFS("images", {}) ]
#)

# -----------------------   病人 profile  -----------------------------
Schema.PatientProfile = new SimpleSchema(
  diseases_type:
    type:String
    label:"患病类型"

  last_t:
    type:String
    label:"上次治疗时间"

)


# -----------------------  Schema for Meteor users  -----------------------------
Schema.User = new SimpleSchema(
  username:
    type: String
    regEx: /^[a-z0-9A-Z_@.]{1,15}$/
    label: "用户名"
    defaultValue: "doc2"
  name:
    type: String
    label: "真实姓名"
  mobile:
    type: Number
    label:'手机'
  age:
    type: Date
    label: '出生日期'
  hospital:
    type: String
    label:'医院'
  department:
    type: String
    label:'科室'
  password:
    type: String
    label: "密码"
    optional: true
    defaultValue: "123123"

  confirmPassword:
    type: String
    label: "密码确认"
    optional: true
    custom: ->
      if @value isnt @field("password").value
        "密码不一致"
    defaultValue: "123123"

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