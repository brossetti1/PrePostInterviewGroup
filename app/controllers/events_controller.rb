class EventsController < ApplicationController
  before_action :authentication_user_from_token!
  before_action :set_users_current_events, only: [:upcoming_events]
  

  def index

  end

  def upcoming_events
    if @upcoming_events
      render json: "users/upcoming_events.json.jbuilder", status: :ok
    else
      render json: { @upcoming_events.errors.full_messages }, status: :bad_request
    end
  end

  def create

  end

  def update

  end

  def destroy

  end


  private

  def cu
    current_user
  end

  def post_n
    params[:pre_num]
  end

  def pre_n
    params[:pre_num]
  end

  def set_users_current_events
    binding.pry
    if !!params[:post_num] && !!params[:pre_num]
      @upcomming_events = cu.relative_event_date_scheduler(pre_n, post_n)
    elsif !!params[:post_num]
      @upcoming_events = cu.relative_event_date_scheduler(post_num = post_n)
    elsif !!params[:pre_num]
      @upcoming_events = cu.relative_event_date_scheduler(pre_num = pre_n)
    else
      @upcoming_events = cu.relative_event_date_scheduler
    end
  end

end