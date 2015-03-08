class UserProfileController < ApplicationController
  before_action :authentication_user_from_token!


  def show

  end

  def update
    current_user.update_attributes(user_params)
    @address = current_user.address
    @address.update_attributes(address_params)
    render "users/update_profile.json.jbuilder"
  end

  def destroy

  end

  private
  def address_params
    params.require(:user).permit(:street1, :street2, :city, 
                                 :state, :zipcode, :full_address)
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end


