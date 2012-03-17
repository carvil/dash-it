DashIt.ProjectTodosView = Ember.View.extend
  templateName: 'dashit/templates/todos/list'
  todosBinding: 'DashIt.todosController'

  didInsertElement: ->
    project = @get("parentView").get("project")
    @set "project", project

  showNewTodo: 
    -> @set "isNewTodoVisible", true

  hideNewTodo:
    -> @set "isNewTodoVisible", false

  clearFinished: -> 
    todos = @get("todos")
    dones = todos.content.filterProperty("status","done")
    dones.forEach @deleteTodo, @

  deleteTodo: (todo, self) ->
    todo.destroyResource().fail((e) =>
      console.log e
    ).done =>
      @get("project").todos.removeObject todo
