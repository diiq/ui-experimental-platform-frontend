gulp = require('gulp')
karma = require('karma').Server
bowerFiles = require('main-bower-files')
_ = require('lodash')

# Karma options found here:
# http://karma-runner.github.io/0.12/config/configuration-file.html

# We just need to generate a list of bower files with Angular and
# Angular Mocks first in the list, followed by the rest of the app
bowerList = bowerFiles("**/*.js")

_.remove bowerList, (element) ->
  if _.endsWith(element, "angular.js") or
     _.endsWith(element, "angular-mocks.js")
    true

fileList = _.flatten  [
  'bower_components/angular/angular.js'
  'bower_components/angular-mocks.js'
  bowerList
  'dev/**/*.js'
  'test/**/*.js'
]

gulp.task 'test/unit/watch', ['build/dev', 'build/test/unit'], ->
  new karma({
    frameworks: ['jasmine', 'angular-filesort']
    browsers: ['PhantomJS']
    logLevel: 'WARN'
    autoWatch: true
    basePath: 'build/'
    files: fileList
    angularFilesort:
      whitelist: ['dev/**/*.js']
  }).start()

gulp.task 'test/unit/debug', ['build/dev', 'build/test/unit'], ->
  new karma({
    frameworks: ['jasmine', 'angular-filesort']
    browsers: ['Chrome']
    logLevel: 'WARN'
    autoWatch: true
    basePath: 'build/'
    files: fileList
    angularFilesort:
      whitelist: ['dev/**/*.js']
  }).start()

gulp.task 'test/unit', ['build/dev', 'build/test/unit'], (cb) ->
  new karma({
    frameworks: ['jasmine', 'angular-filesort']
    browsers: ['PhantomJS', 'Chrome', 'Firefox']
    singleRun: true
    basePath: 'build/'
    files: fileList
    angularFilesort: {
      whitelist: ['dev/**/*.js']
    }
  }, cb).start()

gulp.task 'test/dist/unit', ['build/dist', 'build/test/unit'], (cb) ->
  new karma({
    frameworks: ['jasmine']
    browsers: ['PhantomJS', 'Chrome', 'Firefox']
    singleRun: true
    basePath: 'build/'
    files: [
      'dist/app.*.js'
      'bower_components/angular-mocks.js'
      'test/**/*.js'
    ]
  }, cb).start()
