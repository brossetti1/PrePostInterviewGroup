class CompanyController < ApplicationController
  before_action :authentication_user_from_token!
  before_action :set_companies, only: [:index, :companies]
  before_action :find_company, only: [:show, :update, :destroy]
  before_action :create_event_heiarchy, only: [:ios_create]


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

  def ios_create
    render "company/ios_create.json.jbuilder", status: :created
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

  def create_event_heiarchy
    @company = Company.create(name: params[:company]['name'], user_id: current_user.id)
    @job = Job.create(job_params)
    @job.update_attributes(user_id: current_user.id, company_id: @company.id)
    
    @pro = Pro.create(pro: params[:pro], job_id: @job.id) if params[:pro]
    @con = Con.create(con: params[:con], job_id: @job.id) if params[:con]
    @address = Address.new(address_params); @address.job_id = @job.id
    @address.save

    @event = Event.create(job_id: @job.id, user_id: current_user.id)
    @event.update_attributes(interview_date: interview_params) if interview_params
  end

  def job_params
    params.require(:company).permit(:job_title, :lead_source, :short_summary, :salary)
  end

  def address_params
    params.require(:company).permit(:street1, :street2, :city, 
                                 :state, :zipcode, :full_address)
  end

  def interview_params
    params[:company]['interview_date']
  end



end

