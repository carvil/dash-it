DashIt.projectsController = Ember.ResourceController.create
  resourceType: DashIt.Project

  set_user_id: (user_id) ->
    @set "user_id", user_id
