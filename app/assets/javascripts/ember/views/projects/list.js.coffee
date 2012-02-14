DashIt.ListProjectsView = Ember.View.extend
  templateName:    'ember/templates/projects/list',
  contactsBinding: 'DashIt.projectsController',
  refreshListing: -> DashIt.projectsController.findAll()
