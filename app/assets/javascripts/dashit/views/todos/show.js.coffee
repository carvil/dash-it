DashIt.ShowTodoView = Ember.View.extend
  templateName: 'dashit/templates/todos/show'
  classNames: ['show-todo']
  tagName: 'dl'

  didInsertElement: ->
    # fetch the project from the previous view
    project = @get("parentView").get("project")
    @set "project", project
    # set the resource url
    todo = @get("todo")
    todo.resourceUrl = project.todos._resourceUrl()
    @set "todo", todo

  doubleClick: ->
    @showTodoEdit()

  showTodoEdit: ->
    @set "isTodoEditing", true

  hideTodoEdit: ->
    @set "isTodoEditing", false
