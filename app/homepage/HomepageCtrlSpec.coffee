describe "HomepageCtrl:", ->
  beforeEach(module("uiExperiments.homepage"))

  beforeEach inject ($controller) ->
    @controllerService = $controller

  describe "homepage.value", ->
    beforeEach inject ->
      @controller = @controllerService "HomepageCtrl"

    it "has the value 'world'", ->
      expect(@controller.value).toBe('Homepage')
