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
