angular.module 'uiExperiments.homepage', [
  'ui.router'
]

angular.module('uiExperiments.homepage').config ($stateProvider) ->
  $stateProvider
    .state 'homepage',
      url: '/'
      templateUrl: '/homepage/homepage.html'
      controller: 'HomepageCtrl as homepage'
