DashIt.todosController = Ember.ResourceController.extend
  resourceType: DashIt.Todo

  _resourceUrl: ->
    return @get("project")._resourceUrl() + "/todos"
