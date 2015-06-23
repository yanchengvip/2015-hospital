Meteor.publishComposite  'usReports',->
  find: ->
    Laniakea.Collection.UsReports.find()
  children: [
    find:(usReports)->

  ]
Meteor.publishComposite  'usReportImages',->
  find: ->
    Laniakea.Collection.UsReportImages.find()