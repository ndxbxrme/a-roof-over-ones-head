'use strict'

angular.module 'propertyApp'
.controller 'LofeDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.lofe = $meteor.object Loves, $stateParams.lofeId
  $meteor.subscribe('loves')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.lofe.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.lofe.reset()
]