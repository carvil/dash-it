DashIt.NewTodoView = Ember.View.extend
  tagName: "form"
  templateName: "dashit/templates/todos/edit"

  init: ->
    @_super()
    @set "todo", DashIt.Todo.create()

  didInsertElement: ->
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    @get("parentView").hideNewTodo()

  submit: (event) ->
    self = @

    # Fetch todo and project
    todo = @get("todo")
    project = @get("parentView").get("parentView").get("project")

    # Build todo object
    todo.status = "todo"
    todo.project_id = project.id
    todo.resourceUrl = project.todos._resourceUrl()

    # Save todo
    event.preventDefault()
    todo.saveResource().fail((e) ->
      console.log e
    ).done ->
      project.todos.pushObject todo
      self.get("parentView").hideNewTodo()

