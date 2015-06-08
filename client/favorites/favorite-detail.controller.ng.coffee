'use strict'

angular.module 'propertyApp'
.controller 'FavoriteDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.favorite = $meteor.object Favorites, $stateParams.favoriteId
  $meteor.subscribe('favorites')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.favorite.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.favorite.reset()
]