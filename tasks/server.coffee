gulp = require('gulp')
browserSync = require('browser-sync')
connect = require('gulp-connect')
modRewrite = require('connect-modrewrite')


# Any paths without a . in them will get served index.html instead
rewrite = modRewrite([ '^[^\\.]*$|.*reset-password.*|.*oauth\/step2.* /index.html [L]' ])

gulp.task 'server/dev', ['build/dev'], ->
  browserSync
    open: false
    notify: false
    ui:
      port: 3002
    server:
      baseDir: ['build/dev', 'build']
      middleware: [rewrite]

gulp.task 'server/dist', ->
  connect.server
    port: 3000
    root: 'build/dist'
    middleware: -> [rewrite]
