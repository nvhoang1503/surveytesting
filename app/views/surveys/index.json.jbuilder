json.array!(@surveys) do |survey|
  json.extract! survey, :id, :question, :user_id, :answer_type_id
  json.url survey_url(survey, format: :json)
end
