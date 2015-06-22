@KnowledgeTrees = new Mongo.Collection ("knowledge_trees")

Schema = {}

Schema.ChildProfile = new SimpleSchema
  pn:
    type: String
    label: '名称'
    optional: true

  findding:
    type: String
    label: "超声所见"
    optional: true

  hint:
    type: String,
    label: '超声所得'
    optional: true

Schema.KnowledgeTree = new SimpleSchema
  name:
    type: String
    label: '名称'
    optional: true

  profile:
    type: Object
    optional: true

  "profile.childProfile":
    type: Schema.ChildProfile
    optional: true

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


KnowledgeTrees.attachSchema Schema.KnowledgeTree
