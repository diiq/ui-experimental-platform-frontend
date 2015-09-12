angular.module 'uiExperiments.login', [
  'ui.router'
  'uiExperiments.users'
]

angular.module('uiExperiments.login').config ($stateProvider) ->
  $stateProvider
    .state 'login',
      url: '/login'
      params:
        destination: null
      templateUrl: '/login/login.html'
      controller: 'LoginCtrl as login'
