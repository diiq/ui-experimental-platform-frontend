angular.module('experimentalPlatform.directives')
.directive 'autoFocus', ($timeout) ->
  restrict: 'AC',
  link: (_scope, _element) ->
    $timeout ->
      _element[0].focus()
