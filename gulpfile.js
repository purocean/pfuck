var gulp = require('gulp');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify');
var plumber = require('gulp-plumber');
var sass = require('gulp-sass');
var livereload = require('gulp-livereload');

// 编译Sass
gulp.task('sass', function() {
    gulp.src('./static/scss/style.scss')
        .pipe(plumber())
        .pipe(sass({outputStyle: 'nested'}))
        .pipe(sass({outputStyle: 'compressed'}))
        .pipe(gulp.dest('./static/css'));
});

gulp.task('build', ['sass']);

// 默认任务
gulp.task('default', function() {
    livereload.listen(port=35729)

    gulp.watch('./static/scss/**/*.scss', ['sass']);
    gulp.watch('./static/css/*.css', function(file) {
        livereload.changed(file.path)
    });
});
