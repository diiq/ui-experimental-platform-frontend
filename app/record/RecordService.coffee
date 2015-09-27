angular.module('uiExperiments.record')
.service 'RecordService', ($http, config) ->

  timeStamp: ->
    new Date().getTime()

  newRecord: (recordAll) ->
    @record = {
      record_all: recordAll
      startTime: @timeStamp()
      primaryEvents: []
      allEvents: []
    }

  recordsUrl: () ->
    "#{config.apiBase}/api/v1/sessions/#{@sessionId}/records"

  saveRecord: ->
    $http.post @recordsUrl(),
      all_events: @record.allEvents,
      primary_events: @record.primaryEvents,


  _stream: (options) ->
    if options.primary
      @record.primaryEvents
    else if @record.record_all
      @record.allEvents

  addEvent: (type, data, options={}) ->
    if !@record
      return

    stream = @_stream(options)
    if stream?
      stream.push
        time: @timeStamp()
        type: type
        payload: data

  sessionsUrl: (experimentSlug) ->
    "#{config.apiBase}/api/v1/experiments/#{experimentSlug}/sessions"

  newSession: (experimentSlug) ->
    $http.post(@sessionsUrl(experimentSlug)).then (response) =>
      @sessionId = response.data.session.id
