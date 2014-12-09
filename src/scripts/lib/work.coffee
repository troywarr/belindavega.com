$        = require 'jquery'
_        = require 'lodash'
projects = require '../data/projects'
utils    = require '../utils/utils'
TMPL     = require '../!tmpl'



#
class Work

  #
  constructor: (@$work) ->
    @$projectTabs = @$work.find('.project-tabs')
    @$projectThumbs = @$work.find('.project-thumbs')
    @currentCategory = 'everything'

  #
  select: (category, $tab = @$projectTabs.children("[data-category=\"#{category}\"]")) ->
    @currentCategory = category # store current category
    $tab.addClass('selected') # select current tab
    $tab.siblings().removeClass('selected') # deselect other tabs
    if category is 'everything'
      @fill(projects) # show every project
    else
      @fill(_.filter(projects, (item) -> category in item.categories)) # show only this category's projects

  #
  initTabs: ->
    @$projectTabs.on 'click', 'li', (event) =>
      $tab = $(event.currentTarget) # shortcut to clicked tab
      category = $tab.data('category') # get category from tab data
      if category isnt @currentCategory # if a new tab was selected
        @select(category, $tab)

  #
  fill: (projectList) ->
    @$projectThumbs.html(TMPL.work({ projects: projectList }))

  #
  fillFirst: ->
    category = window.location.hash.slice(1)
    if category in ['identity', 'print', 'web-design', 'photography']
      @select(category)
    else
      @fill(projects)

  #
  init: ->
    @fillFirst()
    @initTabs()



module.exports = Work
