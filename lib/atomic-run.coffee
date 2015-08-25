path = require 'path'
{allowUnsafeEval, allowUnsafeNewFunction} = require 'loophole'
{cordova, serve, start} = allowUnsafeEval -> allowUnsafeNewFunction -> require 'ionic-app-lib'

module.exports =
  class AtomicServe
    constructor: (serializedState) ->

    emulate: =>
      appPath = window.atom.project.rootDirectories[0].path
      allowUnsafeEval -> allowUnsafeNewFunction -> cordova.runPlatform(appPath,'ios')

    stopServer: =>
      serve.stopServer()

    # serialize: ->
    #
    # # Tear down any state and detach
    # destroy: ->
    #   @element.remove()
    #
    # getElement: ->
    #   @element
