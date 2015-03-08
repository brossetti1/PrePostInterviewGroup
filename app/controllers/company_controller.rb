class CompanyController < ApplicationController
  before_action :authentication_user_from_token!
  before_action :set_companies, only: [:index, :companies]
  before_action :find_company, only: [:show, :update, :destroy]


  def index
    render "company/index.json.jbuilder", status: :ok
  end
    
  #returns a list of all users companies, jobs, and events.
  def companies
    render "company/companies.json.jbuilder", status: :ok
  end

  def show
    render "company/show.json.jbuilder", status: :ok
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
    @company.destroy
  end

  private
  def set_companies
    @companies = current_user.companies
  end

  def find_company
    @company = Company.find(params[:id])
  end

end

