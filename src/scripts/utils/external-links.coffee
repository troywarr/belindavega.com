$ = require 'jquery'



# modify external-facing links (add icon, set target attribute)
class ExternalLinks

  constructor: ->
    @$links = $('a[rel="external"]')

  setTarget: ($link) ->
    $link.attr('target', '_blank')

  addIcon: ($link) ->
    $link.append('<svg class="icon icon-link-external"><use xlink:href="#icon-link-external"></use></svg>') # TODO: render Jade template

  init: =>
    @$links.each (i, element) =>
      $link = $(element)
      @addIcon($link)
      @setTarget($link)



module.exports = ExternalLinks
