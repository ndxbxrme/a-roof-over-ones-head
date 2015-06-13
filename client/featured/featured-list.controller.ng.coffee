'use strict'

angular.module 'propertyApp'
.controller 'FeaturedListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.featured = $meteor.collection () ->
    Featured.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('featured', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.featuredCount = $meteor.object Counts, 'numberOfFeatured', false
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.featured.save $scope.newFeatured
      $scope.newFeatured = undefined
      
  $scope.remove = (featured) ->
    $scope.featured.remove featured
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
]