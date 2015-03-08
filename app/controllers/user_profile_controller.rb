class UserProfileController < ApplicationController
  before_action :authentication_user_from_token!


  def show

  end

  def update
    current_user.update_attributes(user_params)
    if current_user.address
      @address = current_user.address
      @address.update_attributes(address_params)
    else
      @address = Address.new(address_params)
      @address.user_id = current_user.id
      @address.save
    end

    if @address
      render "users/update_profile.json.jbuilder"
    else
      render json: { error: "could not process request" }, status: :unprocessable_entity
    end
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