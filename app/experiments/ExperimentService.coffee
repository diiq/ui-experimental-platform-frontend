angular.module('uiExperiments.experiments')
.service 'ExperimentService', ($http, config) ->

  Experiment: class Experiment
    constructor: (json) ->
      _.extend @, json

  url: "#{config.apiBase}/api/v1/experiments"

  experiments: ->
    $http.get(@url).then (response) =>
      _.map response.data.experiments, (experiment) =>
        new @Experiment(experiment)
