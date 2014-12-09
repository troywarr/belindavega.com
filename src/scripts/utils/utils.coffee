_ = require 'lodash'



utils =

  #
  chunk: (array, n) ->
    return _.compact(array.map((el, i) ->
      if i % n is 0
        return array.slice(i, i + n)
    ))

  #
  getQueryParamValue: (name) ->
    query = window.location.search.substring(1)
    params = query.split('&')
    for param in params
      pair = param.split('=')
      if pair[0] is name
        return pair[1]
    false



module.exports = utils
