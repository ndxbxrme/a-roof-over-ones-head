'use strict'

angular.module 'propertyApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'hidden-list',
    url: '/hidden'
    templateUrl: 'client/hidden/hidden-list.view.html'
    controller: 'HiddenListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'hidden-detail',
    url: '/hidden/:hiddenId'
    templateUrl: 'client/hidden/hidden-detail.view.html'
    controller: 'HiddenDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]