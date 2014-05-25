json.array!(@answers) do |answer|
  json.extract! answer, :id, :survey_id, :content
  json.url answer_url(answer, format: :json)
end
