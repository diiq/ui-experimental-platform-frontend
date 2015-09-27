angular.module('uiExperiments.experiments.fittsLaw')
.directive 'horizDraggable', ($document) ->
  restrict: 'E'
  scope:
    onStart: '&'
    onStop: '&'
  link: (scope, element) ->
    width = null

    element.bind 'mousedown', ->
      scope.moving = true
      pos = element[0].getBoundingClientRect()
      width = pos.right - pos.left
      element.css 'left', pos.left + "px"
      element.addClass 'moving'
      scope.$apply ->
          scope.onStart?(position: pos.left + width/2)

    $document.bind 'mousemove', (e) ->
      if scope.moving
        element.css 'left', e.clientX - width/2 + "px"

    $document.bind 'mouseup', ->
      if scope.moving
        scope.moving = false
        element.removeClass 'moving'
        pos = element[0].getBoundingClientRect()
        scope.$apply ->
          scope.onStop?(position: pos.left + width/2)
