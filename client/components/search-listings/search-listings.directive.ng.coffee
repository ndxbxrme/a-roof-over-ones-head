'use strict'

angular.module 'propertyApp'
.directive 'searchListings', ['smoothScroll', (smoothScroll) ->
  {
    restrict: 'EA'
    templateUrl: 'client/components/search-listings/search-listings.view.html'
    replace: true,
    link: (scope, elem) ->
      scope.page = 0
      scope.itemsPerPage = 20
      scope.pageChanged = (newPageNumber) ->
        scope.page = newPageNumber
        smoothScroll elem[0]
      scope.min = (a, b) ->
        Math.min a, b
  }
]