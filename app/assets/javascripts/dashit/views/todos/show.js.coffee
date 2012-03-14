DashIt.ShowTodoView = Ember.View.extend
  templateName: 'dashit/templates/todos/show'
  classNames: ['show-todo']
  tagName: 'dl'

  didInsertElement: ->
    project = @get("project")
    window.bla = @
