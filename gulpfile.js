var gulp = require('gulp');
var connect = require('gulp-connect');
var sass = require('gulp-sass');

// localhost:8080を立ち上げる
gulp.task('connect', function() {
  connect.server({
    root: './',
    livereload: true,
  });
});

// SassとCSSのコンパイル関係を指定
gulp.task('sass', function(){
  gulp.src('./src/style/**/*.scss')
    .pipe(sass({outputStyle: 'compressed'}))
    .pipe(gulp.dest('./style/'));
});

// Sass の自動監視
gulp.task('sass-watch', ['sass'], function(){
  var watcher = gulp.watch('./src/style/**/*.scss', ['sass']);
  watcher.on('change', function(event) {
  });
});

// `gulp` でlocalhost:8080の立ち上げとSassの監視を開始
gulp.task('default', ['connect', 'sass-watch']);
