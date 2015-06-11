'use strict'

angular.module 'propertyApp'
.factory 'listings', ['$localStorage', '$timeout', '$window', ($localStorage, $timeout, $window) ->
  
  minLat = minLon = 1000
  maxLat = maxLon = -1000
  listings = []
  areas = []
  selected = undefined
  selectedImage = undefined
  loading = undefined
  response = undefined
  map = 
    center: { latitude: 53.38, longitude: -1.46 }
    zoom: 16
    
  getImages = (listing) ->
    if listing and not listing.pics
      Meteor.call 'getImages', listing.lister_url, listing.guid, (err, data) ->
        if angular.isArray data
          listing.pics = data
        else
          console.log data
    
  getAllImages = (index) ->
    getImages listings[index]
    if ++index < listings.length
      $timeout () ->
        getAllImages index
      , 100
  
  getListings = (page, areaIndex) ->
    loading = true
    Meteor.call 'searchListings', areas[areaIndex], page, (err, data) ->
      response = data.data.response
      console.log response
      if ['100', '110', '101'].indexOf(data.data.response.application_response_code) isnt -1
        startIndex = listings.length
        if page is 1
          for listing in data.data.response.listings
            if listing.latitude < minLat then minLat = listing.latitude
            if listing.latitude > maxLat then maxLat = listing.latitude
            if listing.longitude < minLon then minLon = listing.longitude
            if listing.longitude > maxLon then maxLon = listing.longitude
            listings.push listing
          map.bounds =
            northeast: {latitude: maxLat, longitude: maxLon}
            southwest: {latitude: minLat, longitude: minLon} 
        getAllImages startIndex
        if page < parseInt(data.data.response.total_pages)
          $timeout () ->
            getListings ++page, areaIndex
          , if page < 6 then 1000 else 5000
        else if ++areaIndex < areas.length
          $timeout () ->
            getListings 1, areaIndex
          , 1000
        else
          loading = undefined
  
  getAreas = () ->
    minLat = minLon = 1000
    maxLat = maxLon = -1000
    areas = $localStorage.area.split /,/g
    listings = []
    selected = undefined
    selectedImage = undefined
    getListings 1, 0
          
  # Public API
  getAreas: () ->
    getAreas()
  selectListing: (listing) ->
    selected = listing
    map.center = {latitude: listing.latitude, longitude: listing.longitude}
    map.zoom = 16
    return
  selectImage: (url) ->
    selectedImage = url
  selectListingAndImage: (listing, url) ->
    selected = listing
    selectedImage = url
    map.center = {latitude: listing.latitude, longitude: listing.longitude}
    map.zoom = 16
    $window.scrollTo 0, 0
  all: () ->
    listings
  loading: () ->
    loading
  map: () ->
    map
  selectedListing: () ->
    selected
  selectedImage: () ->
    selectedImage
  refresh: () ->
    if $localStorage.area and listings.length is 0
      getAreas()
]