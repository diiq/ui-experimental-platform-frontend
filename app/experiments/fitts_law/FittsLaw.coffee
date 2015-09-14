angular.module 'uiExperiments.experiments.fittsLaw', [
  'ui.router'
]

angular.module('uiExperiments.experiments.fittsLaw').config ($stateProvider) ->
  $stateProvider
    .state 'experiment.fitts-law',
      url: '/fitts-law'
      templateUrl: '/experiments/fitts_law/fitts_law.html'
      controller: 'FittsLawCtrl as experiment'
