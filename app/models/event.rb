# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  research       :text
#  key_findings   :text
#  takeaways      :text
#  outcome        :text
#  thankyou_note  :boolean          default("f")
#  follow_up      :boolean          default("f")
#  referral       :boolean          default("f")
#  feedback       :boolean          default("f")
#  business_card  :boolean          default("f")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  job_id         :integer
#  user_id        :integer
#  interview_date :datetime
#

class Event < ActiveRecord::Base
  belongs_to :job
  has_many :contacts, dependent: :destroy
  belongs_to :user



  def has_interview_date?
    self.interview_date == false ? false : true
  end

  # def research_due
  # end

  # def key_findings_due
  # end

  # def take_aways_due
  # end

  # def outcome_due
  # end

  # def thank_you_note_due
  # end

  # def thank_you_note_alert
  # end

  # def follow_up_due
  # end

  # def follow_up_alert
  # end


end




