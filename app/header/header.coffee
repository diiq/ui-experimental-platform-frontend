angular.module('uiExperiments.header', [])
.directive 'header', ($timeout) ->
  restrict: 'E'
  templateUrl: '/header/header.html'
  scope:
    experiment: '='
