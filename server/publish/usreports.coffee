Meteor.publishComposite  'usreports',->
  find: ->
    Laniakea.Collection.USReports.find()
  children: [
    find:(usReports)->

  ]
Meteor.publishComposite  'usreportImages',->
  find: ->
    Laniakea.Collection.USReportImages.find()