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

