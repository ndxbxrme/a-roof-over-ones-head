'use strict'

angular.module 'propertyApp'
.controller 'FavoritesListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.favorites = $meteor.collection Favorites
  $meteor.subscribe 'favorites'

  $scope.removeFromFavorites = (listing) ->
    $scope.favorites.remove listing
]