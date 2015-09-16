describe "HomepageCtrl:", ->
  beforeEach(module("uiExperiments.homepage"))

  beforeEach inject ($controller) ->
    @controllerService = $controller

  describe "homepage.value", ->
    beforeEach inject ->
      @controller = @controllerService "HomepageCtrl"
