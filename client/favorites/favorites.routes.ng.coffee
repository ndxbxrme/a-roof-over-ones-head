'use strict'

angular.module 'propertyApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'favorites-list',
    url: '/favorites'
    templateUrl: 'client/favorites/favorites-list.view.html'
    controller: 'FavoritesListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'favorite-detail',
    url: '/favorites/:favoriteId'
    templateUrl: 'client/favorites/favorite-detail.view.html'
    controller: 'FavoriteDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]