'use strict'

angular.module 'propertyApp'

.config ['$urlRouterProvider', '$locationProvider', ($urlRouterProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $urlRouterProvider.otherwise '/'
]
.run ['$rootScope', '$state', ($rootScope, $state) ->
  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    if error is 'AUTH_REQUIRED'
      $state.go 'main'
]