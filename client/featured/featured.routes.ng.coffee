'use strict'

angular.module 'propertyApp'
.config ['$stateProvider', ($stateProvider) ->
  ###
  $stateProvider
  .state 'featured-list',
    url: '/featured'
    templateUrl: 'client/featured/featured-list.view.html'
    controller: 'FeaturedListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'featured-detail',
    url: '/featured/:featuredId'
    templateUrl: 'client/featured/featured-detail.view.html'
    controller: 'FeaturedDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  ###
]