angular.module 'uiExperiments.experiments', [
  'ui.router'
  'uiExperiments.record'
  'uiExperiments.config'
]

angular.module('uiExperiments.experiments').config ($stateProvider) ->
  $stateProvider
    .state 'experiments',
      url: '/experiments'
      templateUrl: '/experiments/experiments.html'
      controller: 'ExperimentsCtrl as experiments'

  $stateProvider
    .state 'experiment',
      url: '/experiment'
      templateUrl: '/experiments/experiment.html'
      controller: 'ExperimentCtrl as record'
