DashIt.EditProjectView = Ember.View.extend
  tagName: "form"
  templateName: "ember/templates/projects/edit"
  init: ->
    editableProject = DashIt.Project.create(@get("parentView").get("project"))
    @set "project", editableProject
    @_super()

  didInsertElement: ->
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    @get("parentView").hideEdit()

  submit: (event) ->
    self = this
    project = @get("project")
    event.preventDefault()
    project.saveResource().fail((e) ->
      DashIt.displayError e
    ).done ->
      parentView = self.get("parentView")
      parentView.get("project").duplicatePropertiesprojectt
      parentView.hideEdit()

