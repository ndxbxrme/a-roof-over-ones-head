'use strict'

angular.module 'propertyApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'client/main/main.view.html'
    controller: 'MainCtrl'
]