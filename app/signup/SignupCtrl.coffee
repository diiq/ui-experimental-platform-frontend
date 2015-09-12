angular.module('experimentalPlatform.signup')
.controller 'SignupCtrl', (UserService) ->


  @formSubmit = () =>
    success = =>
      @error = ""
      $state.go($stateParams.destination || "homepage",
        JSON.parse($stateParams.destinationParams || "{}"))

    error = (response) =>
      @password = ""
      @error = "Signup failed."

    UserService.create(@email, @password).then(success, error)

  @value = "Signup"

  return this
