class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  respond_to :json


  def authentication_user_from_token!
    user_token = request.headers['HTTP_AUTHENTICATION_TOKEN']
    user_token ||= params['authentication_token']
    user = user_token && User.find_by_authentication_token(user_token)
    if user
      sign_in user, store: false
    else
      render json: { error: "Authentication failure!" }, status: :unatuthenticated
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :respond_to_not_found

  private
  def respond_to_not_found(*types)
    flash[:warning] = t(:msg_asset_not_available, asset)
    render json: { error: flash[:warning],  status: :not_found }
  end
end
