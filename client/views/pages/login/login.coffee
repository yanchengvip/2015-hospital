
Template.login.events
  'submit form' : (e) ->
    e.preventDefault()

    username =  $('input[name="username"]').val()
    password =  $('input[name="password"]').val()
    console.log(username+"mima:"+password)

    Meteor.loginWithPassword(username,password,(error) ->
      if error
        $("#logintip")[0].setAttribute("class" , "alert alert-danger" )
        $("#logintip")[0].innerHTML  = "用户名或者密码不正确"
      else
#        Session.set('username', username)
    )

    false