'use strict'

angular.module 'propertyApp'
.controller 'BlogListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.blog = $meteor.collection () ->
    Blog.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('blog', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.blogCount = $meteor.object Counts, 'numberOfBlog', false
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.blog.save $scope.newBlog
      $scope.newBlog = undefined
      
  $scope.remove = (blog) ->
    $scope.blog.remove blog
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
]