module.exports = function (grunt) {
    'use strict';
    var path = require('path');
    var lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet;

    var folderMount = function folderMount(connect, point) {
      return connect.static(path.resolve(point));
    };

    grunt.initConfig({

      connect: {
        livereload: {
          options: {
            hostname: '',
            port: 7000,
            middleware: function(connect, options) {
                return [lrSnippet, folderMount(connect, './dist')]
            }
            }
          }
        },

        regarde: {
          fred: {
            files: ['app/*.*', './app/current/*.coffee'],
            tasks: ['coffee', 'livereload']
          }
        },

        coffee: {
          compile: {
            files: {
              'dist/main.js': 'app/main.coffee',
              'dist/current/sketch.js': 'app/current/sketch.coffee',

              'app/lib/requires/req_jquery.js': 'app/lib/requires/req_jquery.coffee',
              'app/lib/requires/req_processing.js': 'app/lib/requires/req_processing.coffee',
              'app/lib/requires/req_hammer.js': 'app/lib/requires/req_hammer.coffee'
            }
          }
        }

      });

      grunt.loadNpmTasks('grunt-regarde');
      grunt.loadNpmTasks('grunt-contrib-connect');
      grunt.loadNpmTasks('grunt-contrib-coffee');
      grunt.loadNpmTasks('grunt-contrib-livereload');

      grunt.registerTask('default', ['coffee', 'livereload-start', 'connect', 'regarde']);
}
