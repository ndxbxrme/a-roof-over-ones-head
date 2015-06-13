'use strict'

angular.module 'propertyApp'
.controller 'FavoritesListCtrl', ['$scope', '$meteor', '$localStorage', ($scope, $meteor, $localStorage) ->
  $scope.favorites = $meteor.collection Favorites, false
  $meteor.subscribe 'favorites'
  $scope.propertyTags = $meteor.collection PropertyTags
  $meteor.subscribe 'propertyTags'
  $scope.storage = $localStorage
  if not $localStorage.favorite_type then $localStorage.favorite_type = 'buy'

  $scope.removeFromFavorites = (listing) ->
    $scope.favorites.remove listing
    
  $scope.tagsChanged = (listing) ->
    listing.editingTags = undefined
    for tag in listing.tags
      delete tag.$$hashKey
      ptag = PropertyTags.findOne({text:tag.text})
      if not ptag
        tag.user = Meteor.userId()
        PropertyTags.insert tag
    $scope.favorites.save _.omit(listing, ['$$hashKey', 'editingTags'])
    
  $scope.loadTags = (query) ->
    PropertyTags.find({
      'text':
        '$regex': '.*' + (query or '') + '.*'
        '$options': 'i'
    }).fetch()
]