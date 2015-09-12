angular.module 'experimentalPlatform.arrowMenuTest', [
  'ui.router'
  'cfp.hotkeys'
  'experimentalPlatform.record'
]

angular.module('experimentalPlatform.arrowMenuTest').config ($stateProvider) ->
  $stateProvider
    .state 'arrowMenuTest',
      url: '/arrow-menu-test'
      templateUrl: '/arrow_menu_test/arrow_menu_test.html'
      controller: 'ArrowMenuTestCtrl as arrowMenuTest'
