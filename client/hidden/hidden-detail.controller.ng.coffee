'use strict'

angular.module 'propertyApp'
.controller 'HiddenDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.hidden = $meteor.object Hidden, $stateParams.hiddenId
  $meteor.subscribe('hidden')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.hidden.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.hidden.reset()
]