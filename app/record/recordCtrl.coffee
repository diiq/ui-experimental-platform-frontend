angular.module('uiExperiments')
.controller 'recordCtrl', (RecordService) ->

  RecordService.newRecord("the best one", 1)

  MAP =
    8: 'backspace'
    9: 'tab'
    13: 'enter'
    16: 'shift'
    17: 'ctrl'
    18: 'alt'
    20: 'capslock'
    27: 'esc'
    32: 'space'
    33: 'pageup'
    34: 'pagedown'
    35: 'end'
    36: 'home'
    37: 'left'
    38: 'up'
    39: 'right'
    40: 'down'
    45: 'ins'
    46: 'del'
    91: 'meta'
    93: 'meta'
    224: 'meta'
    106: '*'
    107: '+'
    109: '-'
    110: '.'
    111: '/'
    186: ';'
    187: '='
    188: ','
    189: '-'
    190: '.'
    191: '/'
    192: '`'
    219: '['
    220: '\\'
    221: ']'
    222: '\''

  @getKey = (e) ->
    MAP[e.which] || String.fromCharCode(e.which).toLowerCase()

  @convertKeyEvent = (e) ->
    key: @getKey(e)
    which: e.which
    ctrl: e.ctrlKey
    shift: e.shiftKey
    meta: e.metaKey
    alt: e.altKey

  @key = (type, e) ->
    RecordService.addEvent type, @convertKeyEvent(e)

  @convertMouseEvent = (e) ->
    ctrl: e.ctrlKey
    shift: e.shiftKey
    meta: e.metaKey
    alt: e.altKey
    pageX: e.pageX
    pageY: e.pageY
    movementX: e.movementX
    movementY: e.movementY
    offsetX: e.offsetX
    offsetY: e.offsetY
    which: e.which
    key: @getKey(e)

  @mouse = (type, e) ->
    RecordService.addEvent type, @convertMouseEvent(e)

  @mouseMove = _.throttle(@mouse, 100, leading: true, trailing: true)

  return this
