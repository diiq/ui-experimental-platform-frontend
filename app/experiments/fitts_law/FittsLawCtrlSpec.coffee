describe "FittsLawCtrl:", ->
  beforeEach(module("uiExperiments.experiments.fittsLaw"))

  beforeEach inject ($controller) ->
    @controllerService = $controller

  describe "fittsLaw.value", ->
    beforeEach inject ->
      @controller = @controllerService "FittsLawCtrl"

    it "has the value 'world'", ->
      expect(@controller.value).toBe('Fitts Law')
