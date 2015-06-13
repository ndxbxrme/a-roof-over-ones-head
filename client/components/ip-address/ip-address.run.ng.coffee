'use strict'

angular.module 'propertyApp'
.run ['$localStorage', '$http', ($localStorage, $http) ->
  if not $localStorage.country
    $http.get('http://api.hostip.info/get_json.php').success (data) ->
      if data and data.country_code
        $localStorage.country = data.country_code.toLowerCase()
]