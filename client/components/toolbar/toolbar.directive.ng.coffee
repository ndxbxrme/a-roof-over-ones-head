'use strict'

angular.module 'propertyApp'
.directive 'toolbar', [() ->
  {
    restrict: 'AE'
    templateUrl: 'client/components/toolbar/toolbar.view.html'
    replace: true
  }
]