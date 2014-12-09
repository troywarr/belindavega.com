$        = require 'jquery'
_        = require 'lodash'
projects = require '../data/projects'
utils    = require '../utils/utils'
TMPL     = require '../!tmpl'



#
class Project

  #
  constructor: (@$project) ->
    @$title = $('title')
    name = utils.getQueryParamValue('name')
    @project = _.find(projects, (project) -> project.slug is name)

  #
  fill: ->
    @$project.html(TMPL.project({ project: @project }))

  #
  setTitle: ->
    @$title.html("#{@project.name} | #{@$title.html()}")

  #
  init: ->
    @setTitle()
    @fill()



module.exports = Project
