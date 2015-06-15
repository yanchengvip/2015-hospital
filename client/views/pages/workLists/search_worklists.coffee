Template.searchWorklists.events
  'click #search_worklists':(e)->
    e.preventDefault();
    pName = $(e.target).find('[name=pName]').val()
    startTime = $(e.target).find('[name=startTime]').val()
    endTime = $(e.target).find('[name=endTime]').val()
    reg = new RegExp(pName, 'i')
    WorkLists.find({pn: reg, yyTime:{$gte:startTime,$lte:endTime}})


