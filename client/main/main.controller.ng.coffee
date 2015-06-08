'use strict'

angular.module 'propertyApp'
.controller 'MainCtrl', ['$scope', '$meteor', '$http', '$timeout', '$location', '$rootScope', '$document', '$localStorage', ($scope, $meteor, $http, $timeout, $location, $rootScope, $document, $localStorage) ->
  $scope.listings = []
  areas = []
  $scope.priceRange = min: 10, max: 70
  minLat = minLon = 1000
  maxLat = maxLon = -1000
  $scope.favorites = $meteor.collection Favorites
  $meteor.subscribe 'favorites'
  $scope.hidden = $meteor.collection Hidden
  $meteor.subscribe 'hidden'
  $scope.storage = $localStorage
  
  $scope.getAreas = () ->
    minLat = minLon = 1000
    maxLat = maxLon = -1000
    areas = $localStorage.area.split(/,/g)
    $scope.listings = []
    $scope.selected = undefined
    $scope.selectedImage = undefined
    getListings 1, 0
  
  getListings = (page, areaindex) ->
    $scope.loading = true
    Meteor.call 'searchListings', areas[areaindex], page, (err, data) ->
      $scope.response = data.data.response
      if ['100', '110', '101'].indexOf(data.data.response.application_response_code) isnt -1
        startIndex = $scope.listings.length
        if page is 1
          for listing in data.data.response.listings
            if listing.latitude < minLat then minLat = listing.latitude
            if listing.latitude > maxLat then maxLat = listing.latitude
            if listing.longitude < minLon then minLon = listing.longitude
            if listing.longitude > maxLon then maxLon = listing.longitude
            $scope.listings.push listing
          $scope.map.bounds =
            northeast: {latitude: maxLat, longitude: maxLon}
            southwest: {latitude: minLat, longitude: minLon}
        getAllImages startIndex          
        if page < parseInt(data.data.response.total_pages) and page < 6
          $timeout () ->
            getListings ++page, areaindex
          , if page < 6 then 1000 else 5000
        else if ++areaindex < areas.length
          $timeout () ->
            getListings 1, areaindex
          , 1000
        else
          $scope.loading = undefined
      $scope.$apply()
  if $localStorage.area
    $scope.getAreas()
      
  $scope.map =
    center: { latitude: 53.38, longitude: -1.46}
    zoom: 16
    
  getAllImages = (index) ->
    $scope.getImages $scope.listings[index]
    if ++index < $scope.listings.length
      $timeout () ->
        getAllImages index
      , 100
    
  $scope.getImages = (listing) ->
    if listing and not listing.pics
      Meteor.call 'getImages', listing.lister_url, listing.guid, (err, data) ->
        if angular.isArray data
          listing.pics = data
        else
          console.log data
        $scope.$apply()
        
  $scope.selectListing = (listing) ->
    console.log listing.title
    $scope.selected = listing
    $scope.map = 
      center: { latitude: listing.latitude, longitude: listing.longitude }
      zoom: 16
    $scope.$apply()
    return
    
  $scope.selectImage = (url) ->
    $scope.selectedImage = url
    
  $scope.selectListingAndImage = (listing, url) ->
    $scope.selected = listing
    $scope.selectedImage = url
    $document.scrollTop 0, 1000
    $scope.map = 
      center: { latitude: listing.latitude, longitude: listing.longitude }
      zoom: 16
    return
    
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
]