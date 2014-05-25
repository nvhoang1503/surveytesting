json.array!(@results) do |result|
  json.extract! result, :id, :survey_id, :answer_id, :another_content, :answer_email
  json.url result_url(result, format: :json)
end
