'use strict'

angular.module 'propertyApp'
.controller 'LovesListCtrl', ['$scope', '$meteor', 'listings', '$localStorage', ($scope, $meteor, listings, $localStorage) ->
  $scope.listings = listings
  listings.refresh()
  
  if not $localStorage.loved then $localStorage.loved = []
  if not $localStorage.hated then $localStorage.hated = []
  
  $scope.getRandomImage = () ->
    $scope.validImages = []
    for listing in listings.all()
      if listing and listing.pics
        for pic in listing.pics
          if $localStorage.loved.indexOf(pic) is -1 and $localStorage.hated.indexOf(pic) is -1
            $scope.validImages.push pic
    if $scope.validImages.length is 0 then return $scope.goToResults()
    $scope.validImages[Math.floor(Math.random() * $scope.validImages.length)]
    
  $scope.goToResults = () ->
    $scope.results = []
    $scope.showingResults = true
    for listing in listings.all()
      listing.score = 0
      for pic in listing.pics
        if loved.indexOf(pic) isnt -1
          listing.score++
          $scope.thing = Math.random()
      if listing.score > 0
        $scope.results.push listing
    
  $scope.start = () ->
    $scope.image1 = $scope.getRandomImage()
    
  $scope.swipeLeft = (index) ->
    $scope.thing = 'batrz' + Math.random()
    if index is 1
      $localStorage.hated.push $scope.image1
      $scope.reset1 = undefined
      $scope.swipingLeft1 = true
      $scope.image2 = $scope.getRandomImage()
      $scope.swipingLeft2 = undefined
      $scope.swipingRight2 = undefined
      $scope.reset2 = true
    else
      $localStorage.hated.push $scope.image2
      $scope.reset2 = undefined
      $scope.swipingLeft2 = true
      $scope.image1 = $scope.getRandomImage()
      $scope.swipingLeft1 = undefined
      $scope.swipingRight1 = undefined
      $scope.reset1 = true
      
  $scope.swipeRight = (index) ->
    if index is 1
      $localStorage.loved.push $scope.image1
      $scope.reset1 = undefined
      $scope.swipingRight1 = true
      $scope.image2 = $scope.getRandomImage()
      $scope.swipingRight2 = undefined
      $scope.swipingLeft2 = undefined
      $scope.reset2 = true
    else
      $localStorage.loved.push $scope.image2
      $scope.reset2 = undefined
      $scope.swipingRight2 = true
      $scope.image1 = $scope.getRandomImage()
      $scope.swipingRight1 = undefined
      $scope.swipingLeft1 = undefined
      $scope.reset1 = true
]