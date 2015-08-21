AtomicView = require './atomic-view'
{CompositeDisposable} = require 'atom'
module.exports = Atomic =
  atomicView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomicView = new AtomicView(state.atomicViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomicView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atomic:toggle': => @toggle()
    @subscriptions.add atom.commands.add 'atom-workspace', "atomic:start", => @start()

  start: -> #Ionic start?
    console.log window.atom.project.rootDirectories[0].path

  serve: -> #Ionic serve
    console.log window.atom.project.rootDirectories[0].path

  addPlatform: -> #Ionic platform add
    console.log window.atom.project.rootDirectories[0].path

  rmPlatform: -> #Ionic platform rm
    console.log window.atom.project.rootDirectories[0].path

  addPlugin: -> #Ionic platform add
    console.log window.atom.project.rootDirectories[0].path

  rmPlugin: -> #Ionic platform rm
    console.log window.atom.project.rootDirectories[0].path


  deactivate: -> #{
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomicView.destroy()
  #}
  serialize: ->i #{
    atomicViewState: @atomicView.serialize()
  #}
  toggle: -> # {
    console.log 'Atomic was toggled!'

    if @modalPanel.isVisible() #{
      @modalPanel.hide() #}
    else #{
      @modalPanel.show()
    #}
  #}
