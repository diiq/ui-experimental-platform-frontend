angular.module 'experimentalPlatform.homepage', [
  'ui.router'
]

angular.module('experimentalPlatform.homepage').config ($stateProvider) ->
  $stateProvider
    .state 'homepage',
      url: '/'
      templateUrl: '/homepage/homepage.html'
      controller: 'HomepageCtrl as homepage'
