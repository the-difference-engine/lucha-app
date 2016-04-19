(function() {
  "use strict";

  angular.module("app", ["ngAnimate"]).

  config(["$httpProvider", function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }
  ]);



}());