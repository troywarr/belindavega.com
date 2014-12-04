_ = require 'lodash'



utils =

  #
  chunk: (array, n) ->
    return _.compact(array.map((el, i) ->
      if i % n is 0
        return array.slice(i, i + n)
    ))



module.exports = utils
