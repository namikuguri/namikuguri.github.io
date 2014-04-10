module.exports = (grunt) ->
  'use strict'

  # Project configuration:
  grunt.initConfig

    # Metadata:
    pkg: grunt.file.readJSON("package.json")
    banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " + "<%= grunt.template.today(\"yyyy-mm-dd\") %>\n" + "<%= pkg.homepage ? \"* \" + pkg.homepage + \"\\n\" : \"\" %>" + "* Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= pkg.author.name %>;" + " Licensed <%= _.pluck(pkg.licenses, \"type\").join(\", \") %> */\n"

    # Task configuration:

    # `grunt` task
    # Reload live in the browser
    connect:
      site:
        options:
          port: 8080
          base: './'
          open: 'http://localhost:8080/'

    # Compile Slim to HTML
    slim:
      index:
        files: [
          expand: true
          cwd: "src/"
          src: ["*.slim"]
          dest: "./"
          ext: ".html"
        ]
      blog:
        files: [
          expand: true
          cwd: "src/_blog/chroma/"
          src: ["**/**/*.slim"]
          dest: "_blog/chroma/"
          ext: ".html"
        ]

    # Compile SCSS to CSS
    sass:
      index:
        files: [
          expand: true
          cwd: "src/stylesheets/"
          src: ["**/*.scss"]
          dest: "stylesheets/"
          ext: ".css"
        ]
      blog:
        files: [
          expand: true
          cwd: "src/_blog/chroma/"
          src: ["**/**/*.scss"]
          dest: "_blog/chroma/"
          ext: ".css"
        ]

    # Monitoring files, and Do browser live reload
    watch:
      slim:
        files: ["src/{,*/}*.slim", "src/_blog/chroma/**/**/*.slim"]
        tasks: ["slim"]
      sass:
        files: ["src/stylesheets/**/*.scss", "src/_blog/chroma/**/**/*.scss"]
        tasks: ["sass"]
      options:
        livereload: true

    # `grunt deploy` task
    ## Lint HTML
    htmllint:
      index: "*.html"
      blog: "*_blog/chroma/**/**/*.html"

    ## Parse CSS and add vendor-prefixed CSS properties
     autoprefixer:
       index:
         options:
           browsers: ["last 2 version", "ie >= 8"]
         src: ["stylesheets/**/*.css"]
       blog:
         options:
           browsers: ["last 2 version", "ie >= 8"]
         src: ["_blog/chroma/**/**/*.css"]

    ## Lint CSS
    csslint:
      options:
        "box-model": false
        "fallback-colors": false
      index:
        src: ["stylesheets/**/*.css"]
      blog:
        src: ["_blog/chroma/**/**/*.css"]

  # Setting Load & Register task:
  grunt.registerTask "default", [], ->
    grunt.loadNpmTasks "grunt-contrib-connect"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.task.run "connect", "watch"

  grunt.registerTask "deploy", [], ->
    grunt.loadNpmTasks "grunt-html"
    grunt.loadNpmTasks "grunt-autoprefixer"
    grunt.loadNpmTasks "grunt-contrib-csslint"
    grunt.task.run "htmllint", "autoprefixer", "csslint"

  grunt.registerTask "slim", [], ->
    grunt.loadNpmTasks "grunt-slim"
    grunt.task.run "slim"

  grunt.registerTask "sass", [], ->
    grunt.loadNpmTasks "grunt-contrib-sass"
    grunt.task.run "sass"
