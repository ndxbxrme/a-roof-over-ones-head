'use strict'

angular.module 'propertyApp'
.directive 'searchListings', [() ->
  {
    restrict: 'EA'
    templateUrl: 'client/components/search-listings/search-listings.view.html'
    replace: true
  }
]