DashIt.ShowProjectView = Ember.View.extend
  templateName: 'dashit/templates/projects/show'
  classNames: ['show-project']
  tagName: 'dl'

  didInsertElement: ->
    @set "todos", @get("project").get("todos").findAll()

  doubleClick: ->
    @showEdit()

  showEdit: ->
    @set "isEditing", true

  hideEdit: ->
    @set "isEditing", false

  toggleTodos: ->
    if @get("displayTodos")
      @set "displayTodos", false
    else
      @set "displayTodos", true

  destroyRecord: ->
    project = @get("project")
    project.destroyResource().fail((e) ->
      console.log e
    ).done ->
      DashIt.projectsController.removeObject project
