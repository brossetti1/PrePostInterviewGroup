json.user do
	json.email current_user.email
	json.username current_user.username
	json.street1 @address.street1
	json.street2 @address.street2
	json.city @address.city
	json.state @address.state
	json.zipcode @address.zipcode
	json.full_address @address.full_address
end
