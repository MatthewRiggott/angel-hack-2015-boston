json.array!(@recommendations) do |recommendation|
  json.extract! recommendation, :id, :location, :user_id, :details, :title
  json.url recommendation_url(recommendation, format: :json)
end
