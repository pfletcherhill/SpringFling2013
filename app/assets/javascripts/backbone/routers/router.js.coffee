class SpringFling.Router extends Backbone.Router
  
  initialize: (options) ->
    @artists = new SpringFling.Collections.Artists()
    @artists.add(options.artists)
    @view = new SpringFling.Views.Index(artists: @artists)
    
  routes:
    "apparel" : "apparel"
    "welcome" : "welcome"
    ":id" : "artist"
    ".*" : "index"
  
  apparel: ->
    @view.renderApparel()
  
  welcome: ->
    @view.welcome()
    
  index: ->
    @view.renderHome()
    
  artist: (id) ->
    @view.render(id)
    