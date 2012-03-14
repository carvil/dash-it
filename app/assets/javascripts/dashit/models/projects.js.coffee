DashIt.Project  = Ember.Resource.extend
  resourceUrl:        '/projects'
  resourceName:       'project'
  resourceProperties: ['name']

  init: ->
    @set "todos", DashIt.todosController.create(project: @ )
