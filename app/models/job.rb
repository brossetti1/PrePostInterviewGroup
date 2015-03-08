# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  job_title     :string
#  lead_source   :string
#  short_summary :text
#  salary        :integer
#  company_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Job < ActiveRecord::Base
  has_many :events, dependent: :destroy
  belongs_to :company
  belongs_to :user
  has_one :address, dependent: :destroy

  has_many :pros
  has_many :cons

  serialize :pro
  serialize :con




  def attr_changed?
    self.previous_changes.count == 0 ? false : true
  end

end



