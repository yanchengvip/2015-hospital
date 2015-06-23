if Meteor.users.find().count()==0
  newUserData={
    username: "d1"
    password:"d123456"
    profile:
      userProfile:{
        name:"d1"
        roles:["doctor"]
        age:40
        gender:"男"
        mobile:"15810159329"
        hospital_id:""
        department_id:""
      }

    }

  newUserData2={
    username: "d2"
    password:"d123456"
    profile:
      userProfile:{
        name:"d2"
        roles:["doctor"]
        age:40
        gender:"男"
        mobile:"15810159320"
        hospital_id:""
        department_id:""
      }

  }
  newUserData3={
    username: "d3"
    password:"d123456"
    profile:
      userProfile:{
        name:"d2"
        roles:["doctor"]
        age:40
        gender:"男"
        mobile:"15810159323"
        hospital_id:""
        department_id:""
      }

  }
  Accounts.createUser(newUserData)
  Accounts.createUser(newUserData2)
  Accounts.createUser(newUserData3)

#  默认工作流列表
if WorkLists.find().count() == 0
  i = 0
  while i < 10
    WorkLists.insert
      pn: '张三' + i
      pg: if i % 2 == 0 then '男' else '女'
      pa: 34
      yyTime: new Date
      yyd: '张梅'
      yydp: '肿瘤科'
      jcbw: '头部'
      jcxm: 'CT'
      state: '患者预约'
    i++