class window.Result
  constructor: ->
    @clickOnViewChart()
    

  clickOnViewChart: ->
    $(document).on "click", "#view_chart",  ->
      location.reload()
      # alert 123456



