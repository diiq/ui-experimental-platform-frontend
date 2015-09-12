angular.module 'uiExperiments.signup', [
  'ui.router'
  'uiExperiments.users'
]

angular.module('uiExperiments.signup').config ($stateProvider) ->
  $stateProvider
    .state 'signup',
      url: '/signup'
      params:
        destination: null
      templateUrl: '/signup/signup.html'
      controller: 'SignupCtrl as signup'
