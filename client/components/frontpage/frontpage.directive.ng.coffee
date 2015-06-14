'use strict'

angular.module 'propertyApp'
.directive 'frontpage', [() ->
  {
    restrict: 'EA'
    templateUrl: 'client/components/frontpage/frontpage.view.html'
    replace: true
  }
]