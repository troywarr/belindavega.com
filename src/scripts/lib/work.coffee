$        = require 'jquery'
_        = require 'lodash'
projects = require '../data/projects'
utils    = require '../utils/utils'
TMPL     = require '../!tmpl'



#
class Work

  constructor: (@$work) ->
    @$projectTabs = @$work.find('.project-tabs')
    @$projectThumbs = @$work.find('.project-thumbs')
    @currentCategory = 'everything'

  select: ->

  initTabs: ->
    @$projectTabs.on 'click', 'li', (event) =>
      $tab = $(event.currentTarget) # shortcut to clicked tab
      category = $tab.data('category') # get category from tab data
      if category isnt @currentCategory # if a new tab was selected
        @currentCategory = category # store current category
        $tab.addClass('selected') # select current tab
        $tab.siblings().removeClass('selected') # deselect other tabs
        if category is 'everything'
          @fill(projects) # show every project
        else
          @fill(_.filter(projects, (item) -> item.category is category)) # show only this category's projects

  fill: (projectList) ->
    @$projectThumbs.html(TMPL.work({ projects: utils.chunk(projectList, 3) }))

  init: ->
    @fill(projects)
    @initTabs()



module.exports = Work
