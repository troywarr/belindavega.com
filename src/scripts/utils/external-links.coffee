$ = require 'jquery'



# modify external-facing links (add icon, set target attribute)
class ExternalLinks

  constructor: ->
    @$links = $('a[rel="external"]')

  setTarget: ($link) ->
    $link.attr('target', '_blank')

  init: =>
    @$links.each (i, element) =>
      $link = $(element)
      @setTarget($link)



module.exports = ExternalLinks
