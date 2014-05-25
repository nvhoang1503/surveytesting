class window.Survey
  constructor: ->
    @clicOnSaveSurveyBtn()
    

  clicOnSaveSurveyBtn: ->
    $(document).on "click", "#make_user_survey",  ->
      arr_select = []
      answer_type = $("#answer_type").val()
      if answer_type == '1'
        $(".answer_single_choice").each (i) ->
          if this.checked
            arr_select.push $(this).val()
      else if answer_type == '2'
        $(".answer_multiple_choice").each (i) ->
          if this.checked
            arr_select.push $(this).val()
      
      if arr_select.length == 0 and $("#other_answer").val().trim().length == 0
        alert "Please choice answer option."
        return false
      else
        $("#user_answer_choice").val arr_select

      if $("#answer_email").val().length < 1
        alert "Please input your email"
        return false
      else if helper.isEmail($("#answer_email").val().trim())
          # Check existitng email for this survey
          survey_id = $("#survey_id").val()
          user_email = $("#answer_email").val()
          $.ajax
            type: "GET"
            url: "/surveys/check_survey_email"
            data: {survey_id: survey_id, user_email: user_email}
            success: (response)->
              if response.data == true
                alert "This email have pushed survey. Please push survey with another email."
                return false
      else
        alert "Invalid email"
        return false
      
      