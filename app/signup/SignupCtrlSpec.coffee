describe "SignupCtrl:", ->
  beforeEach(module("uiExperiments.signup"))

  beforeEach inject ($controller, $rootScope) ->
    @controllerService = $controller
    @scope = $rootScope.$new()

  describe "formSubmit()", ->
    beforeEach inject (@$state, @UserService, $q) ->
      spyOn(@$state, "go")
      spyOn(@UserService, "create").and.callFake =>
        deferred = $q.defer()
        if @succeed
          deferred.resolve()
        else
          deferred.reject(data: {message: "Signup failed."})
        return deferred.promise

      @controller = @controllerService "SignupCtrl",
        $scope: @scope
        $state: @$state
        UserService: @UserService


    describe "a successful signup", ->
      beforeEach ->
        @succeed = true
        @controller.formSubmit()
        @scope.$digest()

      it "calls the login service", ->
        expect(@UserService.create).toHaveBeenCalled()

      it "redirects to the homepage", ->
        expect(@$state.go).toHaveBeenCalledWith("homepage", {})

      it "doesn't show an error to the user", ->
        expect(@controller.error).toBe("")

    describe "a failed signup", ->
      beforeEach ->
        @succeed = false
        @controller.formSubmit()
        @scope.$digest()

      it "calls the login service", ->
        expect(@UserService.create).toHaveBeenCalled()

      it "doesn't redirect the user", ->
        expect(@$state.go).not.toHaveBeenCalledWith()

      it "flashes an error", ->
        expect(@controller.error).toBe("Signup failed.")

      it "clears the password field after a failed login", ->
        expect(@controller.password).toBeFalsy()
