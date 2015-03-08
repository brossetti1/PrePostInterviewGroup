class CompanyController < ApplicationController
  before_action :authentication_user_from_token!
  before_action :set_companies

  def index
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

  private
  def set_companies
    @companies = current_user.companies
  end

end



# user_id
# @companies.each do |company|
#   puts company.id
#   puts company.name
#   company.jobs.each do |job|
#     job.id
#     job.job_title
#     job.lead_source
#     job.short_summary
#     job.salary
#     job.events.each do |event|
#       event.id
#       event.research
#       event.key_findings
#       event.takeaways
#       event.outcome
#       event.thankyou_note
#       event.follow_up
#       event.referral
#       event.feedback
#       event.business_card
  
#   end
# end