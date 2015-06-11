'use strict'

angular.module 'propertyApp'
.controller 'FavoritesListCtrl', ['$scope', '$meteor', '$localStorage', ($scope, $meteor, $localStorage) ->
  $scope.favorites = $meteor.collection Favorites
  $meteor.subscribe 'favorites'
  $scope.storage = $localStorage
  if not $localStorage.favorite_type then $localStorage.favorite_type = 'buy'

  $scope.removeFromFavorites = (listing) ->
    $scope.favorites.remove listing
]