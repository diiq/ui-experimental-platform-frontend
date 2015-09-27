angular.module('uiExperiments.directives')
.directive 'experiment', () ->
  restrict: 'E'
  templateUrl: '/experiments/experiment_directive.html'
  scope:
    experiment: '='
