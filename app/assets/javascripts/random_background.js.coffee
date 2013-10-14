getRandomImage = ->
  url = "http://api.flickr.com/services/rest/?format=json&sort=interestingness-desc&method=flickr.photos.search&tags=nature&tag_mode=all&api_key=#{flickrApiKey}"
  $.getScript url

@jsonFlickrApi = (result) ->
  if result.stat == "ok" && result.photos.total?
    randomIndex = Math.ceil(Math.random() * result.photos.photo.length)
    photo = result.photos.photo[randomIndex]

    url = "http://farm#{photo.farm}.static.flickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_b.jpg"

    $('body').css('background-image', "url(#{url})")

$ ->
  setInterval getRandomImage, 60000
  getRandomImage()
