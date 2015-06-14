'use strict'

angular.module 'propertyApp'
.directive 'selectedProperty', [() ->
  {
    restrict: 'EA'
    templateUrl: 'client/components/selected-property/selected-property.view.html'
    replace: true
    link: (scope, elem, attrs) ->
      scope.property = 'selectedProperty'
  }
]