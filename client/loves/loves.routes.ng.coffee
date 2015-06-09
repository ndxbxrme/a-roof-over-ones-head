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
  .state 'love-detail',
    url: '/loves/:loveId'
    templateUrl: 'client/loves/love-detail.view.html'
    controller: 'LoveDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]