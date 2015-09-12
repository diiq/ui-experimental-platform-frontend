# Declare the main module and dependencies
angular.module('uiExperiments', [
  # External modules
  'ui.router'
  'angular-loading-bar'
  'uiExperiments.record'
  'uiExperiments.config'
  'uiExperiments.directives'

  # MODULE LIST AUTOGEN BELOW THIS LINE
  'uiExperiments.signup'
  'uiExperiments.homepage'
  'uiExperiments.login'
  'uiExperiments.arrowMenuTest'
])


angular.module('uiExperiments').config ($locationProvider) ->
  $locationProvider.html5Mode(enabled: true, requireBase: false).hashPrefix('!');

angular.module('uiExperiments').config ($urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')

angular.module('uiExperiments').config ($httpProvider) ->
  $httpProvider.defaults.withCredentials = true
  $httpProvider.defaults.headers.delete = {'Content-Type': 'application/json'}

angular.module('uiExperiments').config (cfpLoadingBarProvider) ->
  cfpLoadingBarProvider.includeSpinner = false
  cfpLoadingBarProvider.latencyThreshold = 250

# We have to have $state here, to avoid this bug:
# https://github.com/angular-ui/ui-router/issues/679#issuecomment-31116942
angular.module('uiExperiments').run ($state, $rootScope) ->

  # UI Router silently swallows errors on resolve. This exposes them.
  $rootScope.$on '$stateChangeError',
    (event, toState, toParams, fromState, fromParams, error) ->
      throw error

angular.module('uiExperiments').run ($rootScope, hotkeys) ->
  $rootScope.$on '$stateChangeStart',
    (event, toState, toParams, fromState, fromParams) ->
      hotkeys.purgeHotkeys()
