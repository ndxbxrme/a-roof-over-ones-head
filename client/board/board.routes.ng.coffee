'use strict'

angular.module 'propertyApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'board',
    url: '/board/:boardType/:userId/:tag'
    templateUrl: 'client/board/board.view.html'
    controller: 'BoardCtrl'
]