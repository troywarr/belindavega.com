$               = require 'jquery'
Work            = require './lib/work'
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
  work = new Work($work)
  work.init()
