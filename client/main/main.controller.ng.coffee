'use strict'

angular.module 'propertyApp'
.controller 'MainCtrl', ['$scope', '$meteor', '$rootScope', '$localStorage', 'listings', ($scope, $meteor, $rootScope, $localStorage, listings) ->
  $scope.priceRange = min: 10, max: 70
  $scope.favorites = $meteor.collection Favorites
  $meteor.subscribe 'favorites'
  $scope.hidden = $meteor.collection Hidden
  $meteor.subscribe 'hidden'
  $scope.storage = $localStorage
  $scope.listings = listings;
  
  
  if $localStorage.area and listings.all().length is 0
    listings.getAreas()
    
  $scope.addToFavorites = (listing) ->
    listing.userId = $rootScope.currentUser._id
    $scope.favorites.save _.omit(listing, '$$hashKey')
  
  $scope.isFavorite = (listing) ->
    if listing
      for favorite in $scope.favorites
        if favorite.guid is listing.guid
          return true
    return false
    
  $scope.hide = (listing) ->
    listing.userId = $rootScope.currentUser._id
    $scope.hidden.save _.omit(listing, '$$hashKey')
    
  $scope.isHidden = (listing) ->
    if listing
      for hidden in $scope.hidden
        if hidden.guid is listing.guid
          return true
    return false
    
  $scope.searchFor = (area) ->
    $localStorage.area = area
    $scope.getAreas()
    
  $scope.selectListing = (listing) ->
    console.log listing.title
    listings.selectListing listing
    $scope.$apply()
    return
]