json.array!(@validations) do |validation|
  json.extract! validation, :id
  json.url validation_url(validation, format: :json)
end
