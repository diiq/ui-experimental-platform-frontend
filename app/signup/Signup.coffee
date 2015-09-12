angular.module 'experimentalPlatform.signup', [
  'ui.router'
  'experimentalPlatform.users'
]

angular.module('experimentalPlatform.signup').config ($stateProvider) ->
  $stateProvider
    .state 'signup',
      url: '/signup'
      templateUrl: '/signup/signup.html'
      controller: 'SignupCtrl as signup'
