angular.module('uiExperiments.directives')
.directive 'experiment', ($timeout) ->
  restrict: 'E'
  templateUrl: '/experiments/experiment_directive.html'
  scope:
    experiment: '='
