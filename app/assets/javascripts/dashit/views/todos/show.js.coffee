DashIt.ShowTodoView = Ember.View.extend
  templateName: 'dashit/templates/todos/show'
  classNames: ['show-todo']
  tagName: 'dl'

  didInsertElement: ->
    project = @get("parentView").get("project")
    @set "project", project

  doubleClick: ->
    @showTodoEdit()

  showTodoEdit: ->
    @set "isTodoEditing", true

  hideTodoEdit: ->
    @set "isTodoEditing", false


