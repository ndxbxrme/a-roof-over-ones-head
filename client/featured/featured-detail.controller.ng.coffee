'use strict'

angular.module 'propertyApp'
.controller 'FeaturedDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.featured = $meteor.object Featured, $stateParams.featuredId
  $meteor.subscribe('featured')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.featured.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.featured.reset()
]