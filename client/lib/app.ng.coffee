angular.module 'propertyApp', [
  'angular-meteor'
  'ui.router'
  'ui.bootstrap'
  'angularUtils.directives.dirPagination'
  'uiGmapgoogle-maps'
  'angular.filter'
  'ui-rangeSlider'
  'afkl.lazyImage'
  'angular-nicescroll'
  'ngStorage'
]

onReady = () ->
  angular.bootstrap document, ['propertyApp']
  
if Meteor.isCordova
  angular.element(document).on 'deviceready', onReady
else
  angular.element(document).ready onReady