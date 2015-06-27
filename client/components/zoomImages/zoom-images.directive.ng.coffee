'use strict'

angular.module 'propertyApp'
.directive 'zoomImages', ['$document', '$window', '$timeout', ($document, $window, $timeout) ->
  {
    restrict: 'EA'
    scope:
      options: '=zoomImages'
    link: (scope, elem, attrs) ->
      zoom = elem.append '<div class="zoom-bg"><div id="zoom-box"><img src="" id="zoom-img" /><div class="zoom-prev"><span>&lt;</span></div><div class="zoom-next"><span>&gt;</span></div><div id="zoom-price"></div><div id="zoom-title"></div></div></div>'
      zoomImg = angular.element('#zoom-img')
      zoomBox = angular.element('#zoom-box')
      zoomPrice = angular.element('#zoom-price')
      zoomTitle = angular.element('#zoom-title')
      elem.css 'min-height':'100%'
      offset = undefined
      initialSize = {};
      $w = angular.element($window)
      elem.on 'click', (event) ->
        target = event.target
        $t = angular.element target
        if $t.hasClass('zoom-prev') or $t.hasClass('zoom-next')
          allImages = angular.element('img.enhance,.enhance img')
          for image, index in allImages
            if image.src is zoomImg[0].src
              if $t.hasClass 'zoom-prev'
                if index is 0 then index = allImages.length-1 else index--
              else
                if index is allImages.length-1 then index=0 else index++
              img = document.createElement 'img'
              offset = angular.element(allImages[index]).offset()
              if angular.element(allImages[index]).hasClass('first') or angular.element(allImages[index].parentNode).hasClass('first')
                console.log 'yowza'
                $w.scrollTop(offset.top - 200)
              #if (offset.top < $w.scrollTop()) or (offset.top + image.height > $w.scrollTop() + $w.innerHeight())
              #  console.log 'scrollin'
              #  $w.scrollTop(offset.top - 100)
              console.log offset.top + $t.height(), $w.scrollTop(), $w.innerHeight()
              img.onload = () ->
                size = 
                  h:parseInt(img.height)
                  w:parseInt(img.width)
                margin = if scope.options then scope.options.margin else 20
                if size.h > $w[0].innerHeight - margin
                  size.w = size.w / size.h * ($w[0].innerHeight - margin)
                  size.h = $w[0].innerHeight - margin
                if size.w > $w[0].innerWidth - margin
                  size.h = size.h / size.w * ($w[0].innerWidth - margin)
                  size.w = $w[0].innerWidth - margin
                zoomImg[0].src = img.src
                zoomBox.css
                  height: size.h
                  width: size.w
                zoomPrice.text angular.element(allImages[index]).attr('price') or angular.element(allImages[index].parentNode).attr('price')
                zoomTitle.text angular.element(allImages[index]).attr('title') or angular.element(allImages[index].parentNode).attr('title')
              img.src = allImages[index].src
              break          
          #console.log allImages
          return
        if elem.hasClass 'zoom-open'
          event.preventDefault()
          zoomBox.css
            top:offset.top - angular.element($window).scrollTop() + (initialSize.h / 2)
            height: initialSize.h
            left:offset.left - angular.element($window).scrollLeft() + (initialSize.w /2)
            width: initialSize.w
            opacity: 0
            transition: if scope.options then scope.options.duration else '0.6s'
          elem.removeClass 'zoom-open'          
          return
        if not target or target.tagName isnt 'IMG' or not ($t.hasClass('enhance') or angular.element(target.parentNode).hasClass('enhance')) then return
        zoomPrice.text $t.attr('price') or angular.element(target.parentNode).attr('price')
        zoomTitle.text $t.attr('title') or angular.element(target.parentNode).attr('title')
        event.preventDefault()
        initialSize = 
          h:target.offsetHeight
          w:target.offsetWidth
        img = document.createElement 'img'
        offset = $t.offset()
        img.onload = () ->
          size = 
            h:parseInt(img.height)
            w:parseInt(img.width)
          margin = if scope.options then scope.options.margin else 20
          if size.h > $w[0].innerHeight - margin
            size.w = size.w / size.h * ($w[0].innerHeight - margin)
            size.h = $w[0].innerHeight - margin
          if size.w > $w[0].innerWidth - margin
            size.h = size.h / size.w * ($w[0].innerWidth - margin)
            size.w = $w[0].innerWidth - margin
          
          zoomImg[0].src = target.src
          zoomBox.css
            top:offset.top - $w.scrollTop() + (initialSize.h / 2)
            height: initialSize.h
            left:offset.left - $w.scrollLeft() + (initialSize.w /2)
            width: initialSize.w
            opacity: 0
            transition: '0s'
          elem.addClass 'zoom-open'
          $timeout () ->
            zoomBox.css
              top:'50%'
              left:'50%'
              height:size.h
              width:size.w
              opacity: 1
              transition: if scope.options then scope.options.duration else '0.6s'
          , 1
        img.src = target.src
  }
]