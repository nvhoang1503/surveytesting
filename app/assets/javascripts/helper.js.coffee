class window.Helper
  constructor: ->
    @autoHideFlash()

  autoHideFlash: ->
    func =-> $('#flash-panel').fadeOut('slow')
    window.setTimeout func, 10000

  isEmail: (email) ->
    regex = /^([a-zA-Z0-9_+-\.])+\@(([a-zA-Z0-9])+\.)+([a-zA-Z0-9]{2,4})+$/
    if email.indexOf('..') > 0 or email.indexOf('.@') > 0
      return false
    return regex.test(email)