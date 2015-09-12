angular.module('experimentalPlatform.arrowMenuTest')
.controller 'ArrowMenuTestCtrl', (hotkeys, RecordService) ->
  _hotkeys = [
    {
      combo: 'space'
      description: 'Print record to console'
      callback: ->
        console.log JSON.stringify(RecordService.record)

    }
  ]

  _.each _hotkeys, hotkeys.add, hotkeys

  @value = "Arrow Menu Test"

  return this
