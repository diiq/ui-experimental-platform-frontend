angular.module('experimentalPlatform.login')
.controller 'LoginCtrl', (UserService, $state, $stateParams) ->

  @formSubmit = () =>
    success = =>
      @error = ""
      $state.go($stateParams.destination || "homepage",
        JSON.parse($stateParams.destinationParams || "{}"))

    error = (response) =>
      @password = ""
      @error = "Login failed."

    UserService.login(@email, @password).then(success, error)

  return this
