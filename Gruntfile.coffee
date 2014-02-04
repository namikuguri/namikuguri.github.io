#global module:false
module.exports = (grunt) ->
  'use strict'

  # Project configuration.
  grunt.initConfig

    # Metadata.
    pkg: grunt.file.readJSON("package.json")
    banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " + "<%= grunt.template.today(\"yyyy-mm-dd\") %>\n" + "<%= pkg.homepage ? \"* \" + pkg.homepage + \"\\n\" : \"\" %>" + "* Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= pkg.author.name %>;" + " Licensed <%= _.pluck(pkg.licenses, \"type\").join(\", \") %> */\n"

    # Task configuration:
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

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-slim"
  grunt.loadNpmTasks "grunt-contrib-sass"

  grunt.registerTask "compile", [
    "slim"
    "sass"
  ]

  return
