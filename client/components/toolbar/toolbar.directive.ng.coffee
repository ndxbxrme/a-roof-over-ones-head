'use strict'

angular.module 'propertyApp'
.directive 'toolbar', ['listings', '$localStorage', (listings, $localStorage) ->
  {
    restrict: 'AE'
    templateUrl: 'client/components/toolbar/toolbar.view.html'
    replace: true,
    link: (scope) ->
      scope.resetListings = () ->
        listings.selectListing undefined
        listings.selectImage undefined
        $localStorage.area = undefined
  }
]