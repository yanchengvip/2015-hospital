@Patients = new Meteor.Collection('patients');

@PatientPictures = new FS.Collection("patientPictures",
  stores: [
    new FS.Store.GridFS "patientPictures",
      transformWrite: (fileObj, readStream, writeStream)->
        gm(readStream).resize(120).stream('PNG').pipe(writeStream);
    new FS.Store.GridFS "patientThumbs",
      beforeWrite: (fileObj)->
        extension: 'png',
        type: 'image/png'
      transformWrite: (fileObj, readStream, writeStream)->
        gm(readStream).resize(60).stream('PNG').pipe(writeStream);

  ]
)

Schemas.Patients = new SimpleSchema
  created_at:
    type: Date,
    autoValue: ->
      if this.isInsert
        new Date()

  updated_at:
    type: Date,
    optional: true,
    autoValue: ->
      if this.isUpdate
        new Date()

#  owner:
#    type: String
#    regEx: SimpleSchema.RegEx.Id
#    autoValue: ->
#      if this.isInsert
#        Meteor.userId()
#    autoform:
#      options: ->
#        _.map Meteor.users.find().fetch(), (user)->
#          label: user.emails[0].address
#          value: user._id
  name:
    type: String,
    label: '姓名',
    max: 20,


  gender:
    type: String
    label: '性别'
    optional: true
    autoform:
      type: 'select-radio-inline'
      options: ->
        男: '男',
        女: '女'
      noselect: true

  birthday:
    type: Date
    label: '出生日期'
    optional: true
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
    autoValue: ->
      if this.isInsert
        new Date()
  birthplace:
    type: String,
    label: '出生地',
    optional: true
  mobile_phoner:
    type: String,
    label: '手机',
    optional: true
  email:
    type: String
    label: '邮箱'
    autoform:
      afFieldInput:
        type: 'email'
    optional: true
  nationality:
    type: String,
    label: '民族',
    optional: true
  education:
    type: String,
    label: '文化程度',
    optional: true
  picture:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'PatientPictures'
    label: '照片'
  credential:
    type: Object,
    label: '证件',
    optional: true
  'credential.credential_type':
    type: String,
    label: '证件类型',
    optional: true,
    autoform:
      afFieldInput:
        firstOption:'请选择证件类型'
      allowedValues:['居民身份证','军官证','武警警官证','护照']
      options:->
        居民身份证:'居民身份证',
        军官证:'军官证',
        武警警官证:'武警警官证',
        护照:'护照'
  'credential.credential_type_number':
    type: String,
    label: '证件号',
    optional: true


  address:
    type: Object,
    label: '地址',
    optional: true
  'address.province':
    type: String,
    label: '省',
    allowedValues:["黑龙江省","辽宁省","吉林省","河北省","河南省","湖北省","湖南省","山东省","山西省","陕西省","
  安徽省","浙江省","江苏省","福建省","广东省","海南省","四川省","云南省","贵州省","青海省","
  甘肃省","江西省","台湾省"],
    autoform:
      afFieldInput:
        firstOption: "请选择省"
    optional: true
  'address.city':
    type: String,
    label: '市',
    optional: true

  'address.address':
    type: String,
    label: '详细地址'
  'address.phone':
    type:String,
    label:'电话'

#  photo_id:
#    type: String,
#    label: '照片'
#    optional: true

  home_info:
    type:Object,
    optional: true,
    label:'家庭信息'
  'home_info.household':
    type: String,
    label: '户籍性质',
    optional: true
  'home_info.marriage':
    type: String,
    label: '婚姻状态',
    optional: true
  'home_info.home_phoner':
    type: String,
    label: '家庭电话',
    optional: true
  'home_info.home_address':
    type: String,
    label: '家庭地址',
    optional: true
  'home_info.contact':
    type: String,
    label: '联系人',
    optional: true
  'home_info.contact_phone':
    type: String,
    label: '联系人电话',
    optional: true
  'home_info.home_postcode':
    type: String,
    label: '住址邮政编码',
    optional: true
  'home_info.introduction':
    type: String,
    label: '介绍',
    optional: true

  patient_info:
    type:Object,
    optional: true,
    label:'患者信息'
  'patient_info.patient_ids':
    type: String,
    label: '患者编号',
    optional: true
  'patient_info.diseases_type':
    type: String,
    label: '患病类型',
    optional: true


  occupation_info:
    type:Object,
    optional: true,
    label:'工作信息'
  'occupation_info.occupation':
    type: String,
    label: '职业',
    optional: true
  'occupation_info.orgnization':
    type: String,
    label: '工作单位',
    optional: true
  'occupation_info.orgnization_address':
    type: String,
    label: '单位地址',
    optional: true
  insurance:
    type:Object,
    optional: true,
    label:'医保'
  'insurance.insurance_type':
    type: String,
    label: '医保类别',
    optional: true
  'insurance.insurance_number':
    type: String,
    label: '医保号码',
    optional: true
#---姓名简写码
  spell_code:
    type: String,
    label: ' ',
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

#----微信
  wechat:
    type: String,
    label: ' ',
    optional: true,
    autoform:
      afFieldInput:
        type:'hidden'


@Patients.search = (query)->
  if !query
    return Patients.find({}, {sort: {createdAt: -1}})
  reg = new RegExp(query, 'i')
  return Patients.find({$or:[{name: reg},{spell_code:reg}]}, {sort: {createdAt: -1}});

Patients.attachSchema(Schemas.Patients);
