class SpringFling.Models.Artist extends Backbone.Model
  paramRoot: 'artist'

  defaults:
    "name" : null

class SpringFling.Collections.Artists extends Backbone.Collection
  model: SpringFling.Models.Artist
  url: '/artists'
