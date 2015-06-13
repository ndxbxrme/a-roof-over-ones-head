'use strict'

angular.module 'propertyApp'
.config ['$stateProvider', ($stateProvider) ->
  ###
  $stateProvider
  .state 'blog-list',
    url: '/blog'
    templateUrl: 'client/blog/blog-list.view.html'
    controller: 'BlogListCtrl'
  .state 'blog-detail',
    url: '/blog/:blogId'
    templateUrl: 'client/blog/blog-detail.view.html'
    controller: 'BlogDetailCtrl'
  ###
]