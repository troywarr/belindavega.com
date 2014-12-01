# dependencies
gulp        = require 'gulp'
gulpIf      = require 'gulp-if'
less        = require 'gulp-less'
minifyCSS   = require 'gulp-minify-css'
notify      = require 'gulp-notify'
concat      = require 'gulp-concat'
rename      = require 'gulp-rename'
imageMin    = require 'gulp-imagemin'
uglify      = require 'gulp-uglify'
coffee      = require 'gulp-coffee'
fileInclude = require 'gulp-file-include'
jade        = require 'gulp-jade'
svgSprite   = require 'gulp-svg-sprites'
runSequence = require 'run-sequence'
pngCrush    = require 'imagemin-pngcrush'
del         = require 'del'
streamQueue = require 'streamqueue'
yargs       = require 'yargs'
browserSync = require 'browser-sync'



# shortcuts
argv = yargs.argv

# environment
PROD = argv.prod
DEV = !PROD

# paths
paths =
  root: ''
  src: 'src/'
  dist: 'dist/'
  npm: 'node_modules/'
  start: 'index.html'



# error handling
handleError = (err) ->
  notify.onError(
    message: "Error: #{err.message}"
  )(err)
  console.log err.toString()
  @emit 'end'



# BrowserSync
gulp.task 'browser-sync', ->
  browserSync
    server:
      baseDir: paths.dist
      directory: true
    port: 2003
    browser: 'google chrome'
    startPath: paths.start

# clean out dist folder
gulp.task 'clean', (done) ->
  del paths.dist, done

# copy root directory files (CNAME, robots.txt, etc.)
gulp.task 'root', ->
  gulp
    .src "#{paths.src}root/**/*"
    .pipe gulp.dest paths.dist

# concat & minify scripts
gulp.task 'scripts', ->
  streamBuild = streamQueue
    objectMode: true

  streamBuild.queue( # javascript
    gulp
      .src [
        "#{paths.npm}jquery/dist/jquery.js"
        "#{paths.npm}underscore/underscore.js"
        "#{paths.src}scripts/vendor/modernizr.js"
      ]
  )

  streamBuild.queue( # coffeescript
    gulp
      .src [
        "#{paths.src}scripts/lib/**/*.coffee"
        "#{paths.src}scripts/main.coffee"
      ]
      .pipe coffee()
  )

  # combine
  streamBuild.done()
    .pipe concat 'main.min.js'
    .pipe gulpIf PROD, uglify()
    .pipe gulp.dest "#{paths.dist}scripts/"

# compile LESS, combine with vendor CSS & minify
#   see: https://github.com/gulpjs/gulp/blob/master/docs/recipes/using-multiple-sources-in-one-task.md
gulp.task 'styles', ->
  gulp
    .src "#{paths.src}styles/*.less"
    .pipe less()
    .pipe rename 'main.min.css'
    .pipe gulpIf PROD, minifyCSS()
    .pipe gulp.dest "#{paths.dist}styles/"
    .pipe gulpIf DEV, browserSync.reload
      stream: true

# compress images
#   see: https://github.com/sindresorhus/gulp-imagemin
gulp.task 'images', ->
  gulp
    .src "#{paths.src}images/*"
    .pipe imageMin
      progressive: true
      svgoPlugins: [
        {
          removeViewBox: false
        }
      ]
      use: [
        pngCrush()
      ]
    .pipe gulp.dest "#{paths.dist}images/"

# SVG icon sprite
#   see: http://css-tricks.com/svg-sprites-use-better-icon-fonts/
# TODO: set up PNG fallback (see: https://www.npmjs.org/package/gulp-svg-sprites)
gulp.task 'svg-icons', ->
  gulp
    .src "#{paths.src}icons/*.svg"
    .pipe svgSprite
      selector: 'icon-%f'
      preview: DEV and { sprite: 'index.html' } # TODO: file bug; setting not honored?
      mode: 'symbols'
    .pipe gulp.dest "#{paths.dist}icons/"

# copy HTML
gulp.task 'html', ['svg-icons'], ->
  gulp
    .src "#{paths.src}jade/pages/*.jade"
    .pipe jade()
    .pipe fileInclude
      basepath: paths.dist
    .pipe gulp.dest paths.dist

# BrowserSync reload
gulp.task 'bs-reload', ->
  browserSync.reload()
  return

# watch for changes
gulp.task 'watch', ->
  gulp.watch "#{paths.src}styles/**/*", ['styles']
  gulp.watch "#{paths.src}scripts/**/*", -> runSequence 'scripts', 'bs-reload'
  gulp.watch "#{paths.src}images/**/*", -> runSequence 'images', 'bs-reload'
  gulp.watch [
    "#{paths.src}jade/**/*.jade"
    "#{paths.src}icons/*.svg"
  ], -> runSequence 'html', 'bs-reload'

# default task: call with 'gulp' on command line
gulp.task 'default', ['clean'], ->
  runSequence ['root', 'html', 'styles', 'scripts', 'images'], ->
    if DEV
      runSequence ['watch', 'browser-sync']
