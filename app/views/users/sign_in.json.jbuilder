json.user do
  	json.user_id @user.id
  	json.username @user.username
  	json.email @user.email
  	json.authentication_token @user.authentication_token
  	json.street1 @address.street1 
	json.street2 @address.street2 
	json.city @address.city 
	json.state @address.state 
	json.zipcode @address.zipcode 
	json.full_address @address.full_address
end

