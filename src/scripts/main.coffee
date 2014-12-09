$               = require 'jquery'
Work            = require './lib/work'
Project         = require './lib/project'
ExternalLinks   = require './utils/external-links'
GoogleAnalytics = require './utils/google-analytics'



$ ->

  # Google Analytics
  googleAnalytics = new GoogleAnalytics
  googleAnalytics.init()

  # external links
  externalLinks = new ExternalLinks
  externalLinks.init()

  #
  $work = $('.work')
  if $work.length
    work = new Work($work)
    work.init()

  #
  $project = $('.project')
  if $project.length
    project = new Project($project)
    project.init()
