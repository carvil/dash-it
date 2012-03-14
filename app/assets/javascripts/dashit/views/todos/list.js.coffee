DashIt.ProjectTodosView = Ember.View.extend
  templateName: 'dashit/templates/todos/list'
  todosBinding: 'DashIt.todosController'

  showNewTodo: 
    -> @set "isNewTodoVisible", true

  hideNewTodo:
    -> @set "isNewTodoVisible", false
