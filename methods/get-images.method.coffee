'use strict'

Meteor.methods
  getImages: (url, guid) ->
    if Meteor.isServer
      future = new Future()
      sluggedUrl = s.slugify url
      listing = Listings.findOne {'guid': guid}
      if listing
        future['return'] listing.pics
      else
        HTTP.get url, (err, data) ->
          propUrl = data.content.match(/url=([^"]+)/)[1]
          HTTP.get propUrl, (err, data) ->
            m = data.content.match(/href="([^"]+)" target="_Blank">Click for Full Version/g)
            if not m
              m = data.content.match(/gallery-[0-9]+" href="[^"]+"/g)
            if not m
              m = data.content.match(/data-slide-index="[0-9]+"><img src="[^"]+"/g)
            if not m
              m = data.content.match(/galleria"><a href="[^"]+"><img/g)
            if not m
              m = data.content.match(/efefef;"> <img src="[^"]+" width="100/g)
            if not m
              m = data.content.match(/src="[^"]+" data-thumb=/g)
            if not m
              m = data.content.match(/content=".*listing_images[^"]+jpg"/g)
            if not m
              m = data.content.match(/src=".*home[^"]+jpg"/g)
            if not m
              m = data.content.match(/u="image" src="[^"]+"/g)
            if not m
              m = data.content.match(/"masterUrl":"[^"]+"/g)
            if not m
              future['return'] data.content
            else
              pics = []
              for match in m
                if match.indexOf('http') isnt -1
                  pics.push match.match(/(href|src|content|"masterUrl")(=|:)"([^"]+)/)[3]
              Listings.insert({'guid':guid, pics:pics})
              future['return'] pics
      future.wait()
      