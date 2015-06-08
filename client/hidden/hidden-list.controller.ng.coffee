'use strict'

angular.module 'propertyApp'
.controller 'HiddenListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.hidden = $meteor.collection () ->
    Hidden.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('hidden', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.hiddenCount = $meteor.object Counts, 'numberOfHidden', false
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.hidden.save $scope.newHidden
      $scope.newHidden = undefined
      
  $scope.remove = (hidden) ->
    $scope.hidden.remove hidden
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
]