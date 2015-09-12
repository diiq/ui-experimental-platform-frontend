describe "LoginCtrl:", ->
  beforeEach(module("uiExperiments.login"))

  beforeEach inject ($controller, $rootScope) ->
    @controllerService = $controller
    @scope = $rootScope.$new()

  describe "formSubmit()", ->
    beforeEach inject (@$state, @UserService, $q) ->
      spyOn(@$state, "go")
      spyOn(@UserService, "login").and.callFake =>
        deferred = $q.defer()
        if @succeed
          deferred.resolve()
        else
          deferred.reject()
        return deferred.promise

      @controller = @controllerService "LoginCtrl",
        $scope: @scope
        $state: @$state
        UserService: @UserService


    describe "a successful login", ->
      beforeEach ->
        @succeed = true
        @controller.formSubmit()
        @scope.$digest()

      it "calls the login service", ->
        expect(@UserService.login).toHaveBeenCalled()

      it "redirects to the homepage", ->
        expect(@$state.go).toHaveBeenCalledWith("homepage", {})

      it "doesn't show an error to the user", ->
        expect(@controller.error).toBe("")

    describe "a failed login", ->
      beforeEach ->
        @succeed = false
        @controller.formSubmit()
        @scope.$digest()

      it "calls the login service", ->
        expect(@UserService.login).toHaveBeenCalled()

      it "doesn't redirect the user", ->
        expect(@$state.go).not.toHaveBeenCalledWith()

      it "flashes an error", ->
        expect(@controller.error).toBe("Login failed.")

      it "clears the password field after a failed login", ->
        expect(@controller.password).toBeFalsy()
