json.array!(@tests) do |test|
  json.extract! test, :id, :blub, :desc
  json.url test_url(test, format: :json)
end
