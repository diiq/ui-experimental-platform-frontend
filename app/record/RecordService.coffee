angular.module('uiExperiments.record')
.service 'RecordService', ($http) ->

  timeStamp: ->
    new Date().getTime()

  newRecord: (experimentName, experimentVersion, recordAll) ->
    @record = {
      record_all: recordAll
      experiment_name: experimentName
      experiment_version: experimentVersion
      startTime: @timeStamp()
      primaryEvents: []
      allEvents: []
    }

  saveRecord: ->
    # TODO
    console.log "Saving record"
    console.log @record

  _stream: (options) ->
    if options.primary
      @record.primaryEvents
    if @record.record_all
      @record.allEvents

  addEvent: (type, data, options={}) ->
    stream = @_stream(options)
    if stream
      stream.push
        time: @timeStamp()
        type: type
        payload: data
