module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt);

  require('time-grunt')(grunt) if grunt.option 'time'

  grunt.initConfig
    jasmine_node:
      options:
        coffee: true
        useCoffee: true
        extensions: 'coffee'
        specNameMatcher: 'Spec'
      test: ['spec/']
    watch:
      javaScript:
        files: ['src/**/*.js', 'spec/**/*.js', 'gruntfile.coffee']
        tasks: ['jshint', 'test']
        options:
          atBegin: true
      coffeeScript:
        files: ['spec/**/*.coffee', 'gruntfile.coffee']
        tasks: ['test']
      config:
        files: ['gruntfile.coffee']
        options:
          reload: true
      testResources:
        files: ['spec/**/*.xml']
        tasks: ['test']
    jshint:
      javaScript: ['src/**/*.js', 'spec/**/*.js']

  grunt.registerTask 'default', ['jshint', 'test']
  grunt.registerTask 'test', ['jasmine_node']
  grunt.registerTask 'tdd', ['watch']
