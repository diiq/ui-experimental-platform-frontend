describe "UserService:", ->
  beforeEach(module("uiExperiments.users"))

  beforeEach inject (@UserService,
                     @$httpBackend,
                     @config) ->
    @baseUrl = "#{@config.apiBase}/api/v1/auth"
    @email = "unit-test@example.com"
    @password = "unsecure"


  describe "login()", ->
    beforeEach ->
      @$httpBackend.whenPOST(@baseUrl).respond()
      @result = @UserService.login(@email, @password)

    afterEach -> @$httpBackend.flush()

    it "POSTs to /auth", ->
      @$httpBackend.expectPOST(@baseUrl,
        email: @email
        password: @password)

    it "returns a promise", ->
      expect(@result.then).toBeDefined()


  describe "logout()", ->
    beforeEach ->
      @$httpBackend.whenDELETE(@baseUrl).respond()
      @result = @UserService.logout()

    afterEach -> @$httpBackend.flush()

    it "DELETEs to /auth", ->
      @$httpBackend.expectDELETE(@baseUrl)

    it "returns a promise", ->
      expect(@result.then).toBeDefined()


  describe "me()", ->
    beforeEach ->
      @url = @baseUrl + "/me"
      @me =
        client_id: 43
        email: @email
        given_name: "Test"
        surname: "User"

      @$httpBackend.whenGET(@url).respond(@me)
      @result = @UserService.me(@email)

    afterEach -> @$httpBackend.flush()

    it "GETs to /auth/me", ->
      @$httpBackend.expectGET(@url)

    it "returns a User object", ->
      expected = new @UserService.User(@me)
      @result.then (response) ->
        expect(response.toString()).toEqual(expected.toString())

    it "returns a promise", ->
      expect(@result.then).toBeDefined()
