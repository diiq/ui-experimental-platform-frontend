angular.module 'experimentalPlatform.login', [
  'ui.router'
]

angular.module('experimentalPlatform.login').config ($stateProvider) ->
  $stateProvider
    .state 'login',
      url: '/login'
      templateUrl: '/login/login.html'
      controller: 'LoginCtrl as login'
