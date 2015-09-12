# Declare the main module and dependencies
angular.module('experimentalPlatform', [
  # External modules
  'ui.router'
  'angular-loading-bar'
  'experimentalPlatform.record'
  'experimentalPlatform.config'

  # MODULE LIST AUTOGEN BELOW THIS LINE
  'experimentalPlatform.homepage'
  'experimentalPlatform.login'
  'experimentalPlatform.arrowMenuTest'
])


angular.module('experimentalPlatform').config ($locationProvider) ->
  $locationProvider.html5Mode(enabled: true, requireBase: false)

angular.module('experimentalPlatform').config ($urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')

angular.module('experimentalPlatform').config ($httpProvider) ->
  $httpProvider.defaults.withCredentials = true
  $httpProvider.defaults.headers.delete = {'Content-Type': 'application/json'}

angular.module('experimentalPlatform').config (cfpLoadingBarProvider) ->
  cfpLoadingBarProvider.includeSpinner = false
  cfpLoadingBarProvider.latencyThreshold = 250

# We have to have $state here, to avoid this bug:
# https://github.com/angular-ui/ui-router/issues/679#issuecomment-31116942
angular.module('experimentalPlatform').run ($state, $rootScope) ->

  # UI Router silently swallows errors on resolve. This exposes them.
  $rootScope.$on '$stateChangeError',
    (event, toState, toParams, fromState, fromParams, error) ->
      throw error

angular.module('experimentalPlatform').run ($rootScope, hotkeys) ->
  $rootScope.$on '$stateChangeStart',
    (event, toState, toParams, fromState, fromParams) ->
      hotkeys.purgeHotkeys()
