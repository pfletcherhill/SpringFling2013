class SpringFling.Router extends Backbone.Router
  
  initialize: (options) ->
    @artists = new SpringFling.Collections.Artists()
    @artists.add(options.artists)
    @view = new SpringFling.Views.Index(artists: @artists)
    @welcome = true
    
  routes:
    "apparel" : "apparel"
    ":id" : "artist"
    ".*" : "index"
  
  apparel: ->
    @welcome = false
    @view.renderApparel()
    
  index: ->
    if @welcome
      @welcome = false
      @view.welcome()
    else
      @view.renderHome()
    
  artist: (id) ->
    @welcome = false
    @view.render(id)
    