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

  # Setting Load & Register task:
  grunt.registerTask "default", [], ->
    grunt.loadNpmTasks "grunt-contrib-connect"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.task.run "connect", "watch"

  grunt.registerTask "slim", [], ->
    grunt.loadNpmTasks "grunt-slim"
    grunt.task.run "slim"

  grunt.registerTask "sass", [], ->
    grunt.loadNpmTasks "grunt-contrib-sass"
    grunt.task.run "sass"
