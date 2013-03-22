SpringFling.Views ||= {}

class SpringFling.Views.Index extends Backbone.View
  
  indexTemplate: JST["backbone/templates/index"]
  detailsTemplate: JST["backbone/templates/artist/details"]
  trackTemplate: JST["backbone/templates/artist/track"]
  slideTemplate: JST["backbone/templates/artist/slide"]
  optionTemplate: JST["backbone/templates/artist/option"]
  homeTemplate: JST["backbone/templates/home"]
  
  el: "body"
  
  initialize: (options) ->
    @artists = options.artists
    $(@el).html(@indexTemplate())
    @populateDropdown()
    layout = _.debounce(@resizeContent, 0);
    $(window).resize(layout);
  
  populateDropdown: ->
    for artist in @artists.models
      $("#dropdown .options").append(@optionTemplate(artist: artist))
  
  reset: (param) ->
    $(".select").removeClass("light dark")
    $(".content .player").html("<div id='player'></div>")
    if param != ""
      if @artist.get("light") == true
        $(".select").addClass "light"
      $(".logo").removeClass("hidden")
      $("#dropdown .selected").html(@artist.get("name")).data("value", param)  
    else
      $(".logo").addClass("hidden")
      $(".select").addClass("dark")
      $("#dropdown .selected").html("Menu").data("value", param)  
       
  renderHome: ->
    @reset("")
    $(".details .container").html(@homeTemplate())
    if @imagesAdded
      @transitionImages()
    else
      @addImages()
 
  addTracks: ->
    for track in @artist.get('tracks')
      $("#playlist").append(@trackTemplate(track))
  
  addImages: (param) ->
    left = 0
    for artist, i in @artists.models
      if artist.get("param") == param
        left = 100*(i + 1)
      image = artist.get("images")[0]
      $("#slideshow").append(@slideTemplate(param: artist.get('param'), url: image.url))
    @imagesAdded = true
    @resizeImages(left)
    $("#slideshow").css("left", "-" + left + "%")
    
  resizeImages: ->
    $("#slideshow").css("width", (@artists.models.length + 1)*100 + "%")
    $(".slide").css("width", $(".content").width() + "px")
  
  transitionImages: (param) ->
    left = 0
    for artist, i in @artists.models
      if artist.get("param") == param
        left = 100*(i + 1)
    $("#slideshow").removeClass("playing").animate({"left": "-" + left + "%"}, 500)
            
  render: (param) ->
    @artist = @artists.where({ param: param })[0]
    @reset(@artist.get('param'))
    $(".details .container").html(@detailsTemplate(artist: @artist))
    @addTracks()
    if @imagesAdded
      @transitionImages(@artist.get('param'))
    else
      @addImages(@artist.get('param'))
    return this
  
  embedYoutube: (url) =>
    $(".content .player").html("<div id='player'></div>")
    @youtube = url
    width = $(".content").width()
    height = Math.floor((width/1.778))
    params = { allowScriptAccess: "always" };
    atts = { id: "player" };
    options = "video_id=" + @youtube + "&enablejsapi=1&playerapiid=player&autoplay=1&showinfo=0&controls=0&modestbranding=1&version=3"
    swfobject.embedSWF("http://www.youtube.com/apiplayer?" + options, "player", width, height, "8", null, null, params, atts)
    @player = $("#player")[0]
    $("#slideshow").addClass("playing")
    
  resizeContent: =>
    width = $(".content").width()
    playerWidth = $("#player").width()
    margin = (width - playerWidth)/2
    $("#player").css("margin-left", margin)
    @resizeImages()
       
  events: 
    "click .paused" : "playTrack"
    "click .select" : "toggleSelect"
    "click .option" : "toggleSelect"
    "click .playing" : "pauseVideo"
    "click .video" : "openVideo"
  
  setButtons: (event) ->
    $(".play-icon").removeClass "playing"
    if event
      $(event.target).addClass "playing"
    
  playTrack: (event) ->
    url = $(event.target).data("url")
    url = url.substring(url.indexOf('?v=')+3)
    if url == @youtube
      @playVideo(event)
    else
      @embedYoutube(url)
      @setButtons(event)
    
  toggleSelect: (event) ->
    event.stopPropagation()
    if $(".arrow").hasClass("open")
      $(".arrow").removeClass("open")
      $(".select .options").hide()
    else
      $(".arrow").addClass("open")
      $(".select .options").show()
  
  pauseVideo: ->
    @player.pauseVideo() 
    @setButtons()
  
  playVideo: (event) ->
    @player.playVideo()
    @setButtons(event)
  
  openVideo: (event) ->
    url = $(event.target).parent().data("url")
    param = $(event.target).parent().data("param")
    window.location = "#" + param