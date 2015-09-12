describe "ArrowMenuTestCtrl:", ->
  beforeEach(module("uiExperiments.arrowMenuTest"))

  beforeEach inject ($controller) ->
    @controllerService = $controller

  describe "arrowMenuTest.value", ->
    beforeEach inject ->
      @controller = @controllerService "ArrowMenuTestCtrl"

    it "has the value 'world'", ->
      expect(@controller.value).toBe('Arrow Menu Test')
