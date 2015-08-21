path = require 'path'
{allowUnsafeEval, allowUnsafeNewFunction} = require 'loophole'
{cordova, serve, start} = allowUnsafeEval -> allowUnsafeNewFunction -> require 'ionic-app-lib'

module.exports =
class AtomicServe
  constructor: (serializedState) ->

  options = {
    address: '0.0.0.0',
    browser: undefined,
    browserOption: '',
    contentSrc: 'www/index.html',
    createDocumentRoot: null,
    defaultBrowser: undefined,
    documentRoot: 'www',
    gulpStartupTasks: undefined,
    isAddressCmd: false,
    launchBrowser: true,
    launchLab: undefined,
    liveReloadPort: 35729,
    port: 8100,
    printConsoleLogs: true,
    printServerLogs: true,
    proxies: [],
    runLivereload: true,
    useProxy: false,
    watchPatterns: [],
    watchSass: false,
  }
  options.appDirectory = window.atom.project.rootDirectories[0].path
  options.watchPatterns = [path.join(options.appDirectory, 'www/**/*'), path.join(options.appDirectory, '!www/**/*')];

  startServer: =>
    serve.start(options)

  stopServer: =>
    serve.stopServer()
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
