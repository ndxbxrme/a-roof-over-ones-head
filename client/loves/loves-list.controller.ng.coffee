'use strict'

angular.module 'propertyApp'
.controller 'LovesListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.loves = $meteor.collection () ->
    Loves.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('loves', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.lovesCount = $meteor.object Counts, 'numberOfLoves', false
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.loves.save $scope.newLofe
      $scope.newLofe = undefined
      
  $scope.remove = (lofe) ->
    $scope.loves.remove lofe
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
]