angular.module('uiExperiments.experiments')
.directive 'experimentCarousel', ($window, $timeout, $interval) ->
  restrict: 'E',
  templateUrl: '/experiments/carousel/experiment_carousel.html'
  scope:
    experiments: '='
  link: (scope, element) ->
    scope.cardflow =
      current: 0
    scope.perPage = 2
    scope.autoAdvance = true

    # Gross magic numbers to fake out responsive card layouts (1, 2,
    # or 3 cards wide)
    calcCardWidth = () ->
      scope.autoAdvance = true
      scope.perPage = 2
      sectionWidth = element[0].offsetWidth
      cardWidth = sectionWidth / 3 - 32
      if cardWidth > 250
        return cardWidth

      scope.perPage = 1
      scope.autoAdvance = false
      cardWidth = sectionWidth / 2 - 36
      if cardWidth > 250
        return cardWidth

      return sectionWidth - 48

    scope.cardWidth = calcCardWidth()

    measureCardWidth = ->
      element.find("experiment")[0].offsetWidth


    # Redraw cards when window changes width (would love to do this
    # with CSS, can't manage it inside hte variable-width carousel
    # container
    w = angular.element($window)

    w.bind 'resize', ->
      scope.$apply ->
        scope.cardWidth = calcCardWidth()
        $timeout ->
          scope.cardflow.cardWidth = measureCardWidth() + 24
          scope.cardflow.current = 0

    # Autoadvance the carousel to show off all the cards, except when
    # the user is interacting with them.
    $interval ->
      if scope.autoAdvance
        scope.cardflow.current += scope.perPage
        if scope.cardflow.current >= scope.experiments.length - scope.perPage
          scope.cardflow.current = 0
    , 5000
