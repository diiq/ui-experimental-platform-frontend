describe "LoginCtrl:", ->
  beforeEach(module("experimentalPlatform.login"))

  beforeEach inject ($controller) ->
    @controllerService = $controller

  describe "login.value", ->
    beforeEach inject ->
      @controller = @controllerService "LoginCtrl"

    it "has the value 'world'", ->
      expect(@controller.value).toBe('Login')
