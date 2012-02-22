DashIt.ShowProjectView = Ember.View.extend
  templateName: 'ember/templates/projects/show'
  classNames: ['show-project']
  tagName: 'tr'

  doubleClick: ->
    @showEdit()

  showEdit: ->
    @set "isEditing", true

  hideEdit: ->
    @set "isEditing", false

  destroyRecord: ->
    project = @get("project")
    project.destroyResource().fail((e) ->
      DashIt.displayError e
    ).done ->
      DashIt.projectsController.removeObject project
