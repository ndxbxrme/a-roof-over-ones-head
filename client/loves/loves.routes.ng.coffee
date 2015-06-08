'use strict'

angular.module 'propertyApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'loves-list',
    url: '/loves'
    templateUrl: 'client/loves/loves-list.view.html'
    controller: 'LovesListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'lofe-detail',
    url: '/loves/:lofeId'
    templateUrl: 'client/loves/lofe-detail.view.html'
    controller: 'LofeDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]