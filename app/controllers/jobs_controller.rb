class JobsController < ApplicationController
  before_action :set_company, [:create]
  before_action :set_job, only: [:update, :destroy, :show]

  def index
    # @jobs = current_user.jobs
    # render "jobs/index.json.jbuilder" unless @jobs.nil?
    # render json: { message: "there are currently no jobs for this user" }, status: :
  end

  def create
    binding.pry
    @job = Job.new(job_params, company_id: @co.id, user_id: @cu.id)
    if @job.save
      render "jobs/create.json.jbuilder", status: :created
    else
      render json: { error: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
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

  end

  private
  def set_company
    @co = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
    @job_cp = @job.dup
  end

  def current_user_ref
    @cu = current_user
  end

  def job_params
    bidning.pry
    params.require(:job).permit(:job_title, :lead_source, :pro, :con,
                                :short_summary, :salary)
  end

end



#test data:

#create
# {
#   "job": 
#     {
#       "job_title": "testingstuff", 
#       "lead_source": "testingstuff", 
#       "pro": "[testingstuff,test,testt]", 
#       "con": "[testingstuff,test,testt]",
#       "short_summary": "testingstuff", 
#       "salary": 1425352
#     }
# }