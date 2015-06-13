'use strict'

angular.module 'propertyApp'
.controller 'BlogDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.blog = $meteor.object Blog, $stateParams.blogId
  $meteor.subscribe('blog')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.blog.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.blog.reset()
]