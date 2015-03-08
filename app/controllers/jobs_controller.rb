class JobsController < ApplicationController
  before_action :authentication_user_from_token!
  before_action :set_company, only: [:create, :index]
  before_action :set_job, only: [:update, :destroy, :show]

  def index
    @jobs = @company.jobs
    if @company.nil?
      render json: { message: "there are currently no jobs for this user" }, status: :no_content
    else
      render "jobs/index.json.jbuilder", status: :created
    end
  end

  def create
    @job = Job.new(job_params)
    @job.company_id = @coompany.id; @job.user_id = current_user.id 
    @job.save; make_pros(@job.id); make_cons(@job.id)
    if @job.id?
      render "jobs/create.json.jbuilder", status: :created
    else
      render json: { error: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    @job_cp = @job.dup
    #TODO check error if errors or if no changes???
    @job.update_attributes(job_params)
    excpt_attr = 'id','created_at','updated_at'
    if @job.attributes.except(excpt_attr) != @job_cp.attributes.except(excpt_attr)
      render "jobs/update.json.jbuilder, status :created"
    else
      render json: { error: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:job_title, :lead_source, :short_summary, :salary)
  end

  def make_pros(job_id)
    ary = params[:job]['pros'] || nil
    if ary
      ary.each do |text|
        Pro.create(pro:text, job_id: job_id)
      end
    end
  end

  def make_cons(job_id)
    ary = params[:job]['cons'] || nil
    if ary
      ary.each do |text|
        Con.create(con:text, job_id: job_id)
      end
    end
  end

end