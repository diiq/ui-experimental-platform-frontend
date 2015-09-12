angular.module('uiExperiments.signup')
.controller 'SignupCtrl', ($scope, UserService, $state, $stateParams) ->

  @formSubmit = () =>
    success = =>
      @error = ""
      $state.go($stateParams.destination || "homepage",
        JSON.parse($stateParams.destinationParams || "{}"))

    error = (response) =>
      @password = ""
      @email = ""
      @error = response.data.message
      $scope.signupForm.$setUntouched()

    UserService.create(@email, @password).then(success, error)

  return this
