AtomicView = require './atomic-view'
{CompositeDisposable} = require 'atom'
AtomicServe = require './atomic-serve'
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
    @subscriptions.add atom.commands.add 'atom-workspace', "atomic:startServer", => @startServer()
    @subscriptions.add atom.commands.add 'atom-workspace', "atomic:stopServer", => @stopServer()
  start: -> #Ionic start?
    console.log window.atom.project.rootDirectories[0].path

  startServer: -> #Ionic serve
    @start = new AtomicServe
    @start.startServer()

  stopServer: -> #Ionic serve
    @stopServer = new AtomicServe
    @stopServer.stopServer()

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
