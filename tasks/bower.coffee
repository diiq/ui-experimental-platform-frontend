gulp = require('gulp')
bowerFiles = require('main-bower-files')
changed = require('gulp-changed')
concat = require('gulp-concat')
filter = require('gulp-filter')
flatten = require('gulp-flatten')
revall = require('gulp-rev-all')
sourcemaps = require('gulp-sourcemaps')


gulp.task 'build/dev/bower', ->
  gulp.src(bowerFiles(), { base: 'bower_components' })
    .pipe(changed('build/bower_components'))
    .pipe(gulp.dest('build/bower_components'))

gulp.task 'build/dist/bower.js', ->
  gulp.src(bowerFiles(), { base: 'bower_components' })
    .pipe(filter('**/*.js'))
    .pipe(concat('bower.js'))
    .pipe(revall(base: 'app'))
    .pipe(gulp.dest('build/dist.tmp'))

gulp.task 'build/dist/bower.css', ->
  gulp.src(bowerFiles(), { base: 'bower_components' })
    .pipe(filter('**/*.css'))
    .pipe(revall(base: 'app'))
    .pipe(concat('bower.css'))
    .pipe(revall(base: 'app'))
    .pipe(gulp.dest('build/dist.tmp'))

gulp.task 'build/dist/bower/fonts', ->
  gulp.src(bowerFiles(), { base: 'bower_components' })
    .pipe(filter(['**/*.eot', '**/*webfont.svg', '**/*.ttf', '**/*.woff', '**/*.otf']))
    .pipe(flatten())
    .pipe(revall(base: 'app'))
    .pipe(gulp.dest('build/dist/fonts'))
