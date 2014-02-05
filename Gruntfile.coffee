module.exports = (grunt) ->
  'use strict'

  # Project configuration:
  grunt.initConfig

    # Metadata:
    pkg: grunt.file.readJSON("package.json")
    banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " + "<%= grunt.template.today(\"yyyy-mm-dd\") %>\n" + "<%= pkg.homepage ? \"* \" + pkg.homepage + \"\\n\" : \"\" %>" + "* Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= pkg.author.name %>;" + " Licensed <%= _.pluck(pkg.licenses, \"type\").join(\", \") %> */\n"

    # Task configuration:
    # Reload live in the browser
    connect:
      site:
        options:
          port: 8080
          base: './'
          open: 'http://localhost:8080/'

    # Compile Slim to HTML
    slim:
      dist:
        files: [
          expand: true
          cwd: "src/"
          src: ["{,*/}*.slim"]
          dest: "./"
          ext: ".html"
        ]

    # Compile SCSS to CSS
    sass:
      dist:
        files: [
          expand: true
          cwd: "src/assets/stylesheets/"
          src: ["**/*.scss"]
          dest: "assets/stylesheets/"
          ext: ".css"
        ]

    # Monitoring files, and Do browser live reload
    watch:
      slim:
        files: "src/{,*/}*.slim"
        tasks: ["slim"]
      sass:
        files: "src/assets/stylesheets/**/*.scss"
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
