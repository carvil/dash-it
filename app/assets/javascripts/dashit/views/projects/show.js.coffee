DashIt.ShowProjectView = Ember.View.extend
  templateName: 'dashit/templates/projects/show'
  classNames: ['show-project']
  tagName: 'dl'

  doubleClick: ->
    @showEdit()

  showEdit: ->
    @set "isEditing", true

  hideEdit: ->
    @set "isEditing", false

  destroyRecord: ->
    project = @get("project")
    project.destroyResource().fail((e) ->
      console.log e
    ).done ->
      DashIt.projectsController.removeObject project
