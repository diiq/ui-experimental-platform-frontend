angular.module 'uiExperiments.homepage', [
  'ui.router'
  'uiExperiments.experiments'
]

angular.module('uiExperiments.homepage').config ($stateProvider) ->
  $stateProvider
    .state 'homepage',
      url: '/'
      templateUrl: '/homepage/homepage.html'
      controller: 'HomepageCtrl as homepage'
