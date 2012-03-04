DashIt.ListProjectsView = Ember.View.extend
  templateName:    'dashit/templates/projects/list'
  projectsBinding: 'DashIt.projectsController'

  refreshListing: 
    -> DashIt.projectsController.findAll()

  showNew: 
    -> @set "isNewVisible", true

  hideNew:
    -> @set "isNewVisible", false
