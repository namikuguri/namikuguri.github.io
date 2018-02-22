var gulp = require('gulp');
var connect = require('gulp-connect');
var haml = require('gulp-ruby-haml');
var sass = require('gulp-sass');

// localhost:8080を立ち上げる
gulp.task('connect', function() {
  connect.server({
    root: './',
    livereload: true,
  });
});

// Hamlのコンパイル
gulp.task('haml', function() {
  gulp.src('./src/**/*.haml').
       pipe(haml()).
       pipe(gulp.dest('./'));
});

// Sassのコンパイル
gulp.task('sass', function(){
  gulp.src('./src/style/**/*.scss')
    .pipe(sass({outputStyle: 'compressed'}))
    .pipe(gulp.dest('./style/'));
});

// 自動監視
gulp.task('watch', function(){
  //Hamlの監視
  gulp.watch('./src/**/*.haml', ['haml']);
  //sassの監視
  gulp.watch('./src/style/**/*.scss', ['sass']);
});

// `gulp` でlocalhost:8080の立ち上げとSassの監視を開始
gulp.task('default', ['connect', 'watch']);
