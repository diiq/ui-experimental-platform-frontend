angular.module 'experimentalPlatform.arrowMenuTest', [
  'ui.router'
  'cfp.hotkeys'
]

angular.module('experimentalPlatform.arrowMenuTest').config ($stateProvider) ->
  $stateProvider
    .state 'arrowMenuTest',
      url: '/arrow-menu-test'
      templateUrl: '/arrow_menu_test/arrow_menu_test.html'
      controller: 'ArrowMenuTestCtrl as arrowMenuTest'
      hotkeys: [
        {
          combo: 'space'
          description: 'This one goes to 11'
          callback: -> alert("r")
        }
      ]
