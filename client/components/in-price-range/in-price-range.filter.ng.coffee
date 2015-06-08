'use strict'

angular.module 'propertyApp'
.filter 'inPriceRange', [() ->
  (input, priceRange) ->
    filteredItems = []
    for item in input
      min = Math.floor(priceRange.min * priceRange.min * priceRange.min / 1000) * 1000
      max = Math.floor(priceRange.max * priceRange.max * priceRange.max / 1000) * 1000
      if item.price >= min and item.price <= max
        filteredItems.push item
    filteredItems
]