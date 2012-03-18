DashIt.Project  = Ember.Resource.extend
  resourceUrl:        '/projects'
  resourceName:       'project'
  resourceProperties: ['name','user_id']

  init: ->
    @set "todos", DashIt.todosController.create(project: @ )
    @set "user_id", DashIt.projectsController.get("user_id")
