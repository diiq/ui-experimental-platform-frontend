angular.module('uiExperiments.homepage')
.controller 'HomepageCtrl', ($scope, @experiments) ->
  @cardflow = {
    current: 0
  }

  @perPage = 2

  @cardWidth = () ->
    @perPage = 2
    sectionWidth = document.getElementById("experiments-section").offsetWidth
    cardWidth = sectionWidth / 3 - 41
    if cardWidth > 250
      return cardWidth

    @perPage = 1
    cardWidth = sectionWidth / 2 - 46
    if cardWidth > 250
      return cardWidth

    return sectionWidth - 32

  return this
