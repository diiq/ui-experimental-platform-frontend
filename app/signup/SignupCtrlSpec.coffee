describe "SignupCtrl:", ->
  beforeEach(module("experimentalPlatform.signup"))

  beforeEach inject ($controller) ->
    @controllerService = $controller

  describe "signup.value", ->
    beforeEach inject ->
      @controller = @controllerService "SignupCtrl"

    it "has the value 'world'", ->
      expect(@controller.value).toBe('Signup')
