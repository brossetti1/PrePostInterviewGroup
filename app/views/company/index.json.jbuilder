json.array! @companies do |company|
  json.company do
    json.id company.id
    json.name company.name
  end
end