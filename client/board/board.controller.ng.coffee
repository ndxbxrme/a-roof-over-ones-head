'use strict'

angular.module 'propertyApp'
.controller 'BoardCtrl', ['$scope', '$meteor', '$stateParams', ($scope, $meteor, $stateParams) ->
  $scope.favorites = $meteor.collection () ->
    Favorites.find(
      userId: $stateParams.userId
      'tags.text': $stateParams.tag
    )
  $meteor.subscribe 'boardProperty', $stateParams.userId, $stateParams.tag
  $scope.tag = $stateParams.tag
  $scope.userId = $stateParams.userId
  $scope.isOwner = () ->
    $stateParams.userId is Meteor.userId()
    
  $scope.remove = (listing) ->
    $scope.favorites.remove listing
    
  $scope.url = Meteor.absoluteUrl()
  
  $scope.selectAll = ($event) ->
    $event.target.select()
]