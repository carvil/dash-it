DashIt.ShowTodoCheckboxView = Ember.Checkbox.extend
  classNames: ["checkbox"]
  classNameBindings: ["value:done"]
  attributeBindings: ['title','value','class']

  change: ->
    todo = @get("todo")
    if !@get("value")
      todo.status = "done"
    else
      todo.status = "todo"
    todo.saveResource().fail((e) ->
      console.log e
    )
    @_super()

  didInsertElement: ->
    # fetch the todo object
    todo = @get("todo")
    # set the checkbox title with the description 
    @set("title", todo.description)
    # set the value depending on the todo status
    if todo.status is "done"
      @set("value", true)
    else
      @set("value", false)
    @_super()
