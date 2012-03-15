DashIt.EditTodoView = Ember.View.extend
  tagName: "form"
  templateName: "dashit/templates/todos/edit"

  init: ->
    editableTodo = DashIt.Todo.create(@get("parentView").get("todo"))
    @set "todo", editableTodo
    project = @get("parentView").get("project")
    @set "project", project
    @_super()

  didInsertElement: ->
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    @get("parentView").hideTodoEdit()

  submit: (event) ->

    # fetch todo and project
    todo = @get("todo")
    project = @get("project")

    # update todo url
    todo.resourceUrl = project.todos._resourceUrl()

    event.preventDefault()
    todo.saveResource().fail((e) =>
      console.log e
    ).done =>
      parentView = @get("parentView")
      parentView.get("todo").duplicateProperties(todo)
      parentView.hideTodoEdit()

