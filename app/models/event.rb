# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  research      :text
#  key_findings  :text
#  takeaways     :text
#  outcome       :text
#  thankyou_note :boolean          default("f")
#  follow_up     :boolean          default("f")
#  referral      :boolean          default("f")
#  feedback      :boolean          default("f")
#  business_card :boolean          default("f")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  job_id        :integer
#  user_id       :integer
#

class Event < ActiveRecord::Base
  belongs_to :job
  has_many :contacts, :dependent => :destroy
  has_one :address, :dependent => :destroy
  belongs_to :user
end
