# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  authentication_token   :string
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :ensure_authentication_token
  after_create :add_address
  has_one :address
  has_one :contact
  has_many :companies
  has_many :jobs
  has_many :events



  def relative_event_date_scheduler(pre_num = 2, post_num = 2)
    events = filtered_events(self)
    events.select do |event| 
      Time.now.between?(event.interview_date-pre_num.days, event.interview_date+post_num.days)
    end
  end

  def filtered_events(user)
    user.events.select do |event| 
      event unless event.interview_date.nil?
    end
  end

  def add_address
    address = Address.new(user_id: self.id)
    address.save
  end


  def ensure_authentication_token
    if self.authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end 

end

