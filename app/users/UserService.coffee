angular.module('experimentalPlatform.users', ['experimentalPlatform.config'])
.service 'UserService', ($http, config) ->

  User: class User
    constructor: (json) ->
      _.extend @, json

  authUrl: "#{config.apiBase}/api/v1/auth"

  usersUrl: "#{config.apiBase}/api/v1/users"

  me: ->
    # Allowing this to return `undefined` means me *always* resolves;
    # that allows us to state-resolve-redirect to login when necessary.
    # Also, if the server doesn't respond in 3 seconds, just give up.
    $http.get(@authUrl + "/me", timeout: 3000).then (response) =>
      user = new @User(response.data)
      user
    , ->
      undefined

  login: (email, password) ->
    $http.post @authUrl, { email: email, password: password }

  logout: () ->
    $http.delete @authUrl

  create: (email, password) ->
    $http.post @usersUrl, { email: email, password: password }
