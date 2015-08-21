# atomic package


Notes for development:

This is coffeescript, indents matter here... sad face


### Add a command to the command-palette

Create a method on the main class

```
module.exports = Atomic =
  atomicView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->


  start: ->
    console.log "Start running"
```

Then add the following to the activate method

```
  activate: (state) ->
    @subscriptions.add atom.commands.add 'atom-workspace', "atomic:start", => @start()
```

### Including ionic-app-lib

Loophole is need to avoid any unsafe-eval erros.

```
npm i --save loophole ionic-app-lib
```

Then import it.

```
{allowUnsafeEval, allowUnsafeNewFunction} = require 'loophole'

{cordova, serve, start} = allowUnsafeEval -> allowUnsafeNewFunction -> require 'ionic-app-lib'
```

It needs to go through `allowUnsafeEval` and then `allowUnsafeNewFunction`


