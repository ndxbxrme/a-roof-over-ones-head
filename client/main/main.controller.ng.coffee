'use strict'

angular.module 'propertyApp'
.controller 'MainCtrl', ['$scope', '$meteor', '$rootScope', '$localStorage', 'listings', '$timeout', ($scope, $meteor, $rootScope, $localStorage, listings, $timeout) ->
  $scope.priceRange = min: 10, max: 70
  $scope.favorites = $meteor.collection Favorites
  $meteor.subscribe 'favorites'
  $scope.hidden = $meteor.collection Hidden
  $meteor.subscribe 'hidden'
  $scope.storage = $localStorage
  $scope.listings = listings
  
  if not $localStorage.sort or $localStorage.sort is '-dateFavorited' then $localStorage.sort = 'price'
  if not $localStorage.listing_type then $localStorage.listing_type = 'buy'
  
  listings.refresh()
  
  $scope.reload = () ->
    $timeout () ->
      listings.reload()
    
  $scope.addToFavorites = (listing) ->
    listing.userId = $rootScope.currentUser._id
    listing.dateFavorited = new Date()
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
    listings.selectListing listing
    $scope.$apply()
    return
]