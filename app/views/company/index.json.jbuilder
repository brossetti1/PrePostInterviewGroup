json.array! @companies do |company|
	json.company_id company.id
	json.name company.name
end