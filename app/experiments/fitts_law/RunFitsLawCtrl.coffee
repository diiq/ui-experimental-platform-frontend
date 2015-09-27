angular.module('uiExperiments.experiments.fittsLaw')
.controller 'RunFittsLawCtrl', ($state, RecordService) ->
  @count = 0
  @goal = 50

  recordSetup = ->
    green = document.getElementById("green-box")
    greenPos = green.getBoundingClientRect()
    red = document.getElementById("red-dot")
    redPos = red.getBoundingClientRect()

    RecordService.addEvent "setup", {
      startLoc: redPos.left
      targetLoc: greenPos.left
      targetWidth: greenPos.right - greenPos.left
      clientWidth: window.innerWidth
    }, primary: true

  randomPercent = ->
    Math.round(Math.random(0) * 100)

  reset = =>
    if @count >= @goal
      $state.go('^.info')

    left = randomPercent()
    width = randomPercent() / 4
    start = randomPercent()
    if start > left and start < left + width
      reset()
    else if left + width > 99
      reset()
    else
      document.getElementById("red-dot").style.left = start + "%"
      @width = width + "%"
      @left = left + "%"
      RecordService.newRecord()
      recordSetup()


  @stopDrag = (pos) ->
    green = document.getElementById("green-box")
    greenPos = green.getBoundingClientRect()
    if pos > greenPos.left and pos < greenPos.right
      RecordService.addEvent "complete", null, primary: true
      RecordService.saveRecord()
      @count += 1
    reset()

  @startDrag = ->
    RecordService.addEvent "start", null, primary: true


  reset()


  return this
