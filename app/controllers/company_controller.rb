class CompanyController < ApplicationController
  before_action :authentication_user_from_token!

  def index
    @companies = Company.all
    render "company/index.json.jbuilder", status: :ok
  end

  def create
    @company = Company.new(user_id: current_user.id, name: params[:name])
    if @company.save
      render "company/create.json.jbuilder", status: :created
    else
      render json: {messages: @company.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy

  end


end