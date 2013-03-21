class SpringFling.Router extends Backbone.Router
  
  initialize: (options) ->
    @artists = new SpringFling.Collections.Artists()
    @artists.add(options.artists)
    @view = new SpringFling.Views.Index(artists: @artists)
    
  routes:
    ":id" : "artist"
    ".*" : "index"
  
  index: ->
    @view.renderHome()
    
  artist: (id) ->
    @view.render(id)
    