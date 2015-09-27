angular.module 'uiExperiments.experiments.fittsLaw', [
  'ui.router'
]

angular.module('uiExperiments.experiments.fittsLaw').config ($stateProvider) ->
  $stateProvider
    .state 'experiment.fitts-law',
      template: '<ui-view></ui-view>'

    .state 'experiment.fitts-law.info',
      url: '/fitts-law'
      templateUrl: '/experiments/fitts_law/fitts_law.html'

    .state 'experiment.fitts-law.instructions',
      url: '/fitts-law/instructions'
      templateUrl: '/experiments/fitts_law/instructions.html'


    .state 'experiment.fitts-law.run',
      url: '/fitts-law/run'
      templateUrl: '/experiments/fitts_law/run.html'
      controller: 'RunFittsLawCtrl as experiment'
      resolve:
        session: (RecordService) ->
          RecordService.newSession("fitts-law")
