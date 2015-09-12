angular.module 'uiExperiments.arrowMenuTest', [
  'ui.router'
  'cfp.hotkeys'
  'uiExperiments.record'
]

angular.module('uiExperiments.arrowMenuTest').config ($stateProvider) ->
  $stateProvider
    .state 'arrowMenuTest',
      url: '/arrow-menu-test'
      templateUrl: '/arrow_menu_test/arrow_menu_test.html'
      controller: 'ArrowMenuTestCtrl as arrowMenuTest'
