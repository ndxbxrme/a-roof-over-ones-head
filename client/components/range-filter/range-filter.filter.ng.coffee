'use strict'

angular.module 'propertyApp'
.filter 'rangeFilter', ['$filter', ($filter) ->
  (input, currency) ->
    $filter('currency')(Math.floor(input * input * input / 1000) * 1000, currency)
]