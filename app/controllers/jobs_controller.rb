class JobsController < ApplicationController
  before_action :authentication_user_from_token!
  before_action :set_company, only: [:create, :index]
  before_action :set_job, only: [:update, :destroy, :show]

  def index
    # @jobs = current_user.jobs
    # render "jobs/index.json.jbuilder" unless @jobs.nil?
    # render json: { message: "there are currently no jobs for this user" }, status: :
  end

  def create
    @job = Job.new(job_params)
    @job.company_id = @co.id; @job.user_id = current_user.id 
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
    @co = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:job_title, :lead_source, :short_summary, :salary)
  end

  def make_pros(job_id)
    ary = params[:pro]['pros'] || nil
    if ary
      ary.each do |text|
        Pro.create(pro:text, job_id: job_id)
      end
    end
  end

  def make_cons(job_id)
    ary = params[:con]['cons'] || nil
    if ary
      ary.each do |text|
        Con.create(con:text, job_id: job_id)
      end
    end
  end

end



#test data:

#create job
# {
#  "job": 
#     {
#       "job_title": "testingstuff", 
#       "lead_source": "testingstuff", 
#       "short_summary": "testingstuff", 
#       "salary": 1425352
#     },
    
#  "pro": 
#     {
#       "pro": ["testing pro create","testprocreate","test_pro_create"]
#     },
    
#   "con":
#     {
#       "con": ["testing pro create","testprocreate","test_pro_create"]
#     }
# }