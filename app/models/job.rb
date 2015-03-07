# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  job_title     :string
#  lead_source   :string
#  pro           :string
#  con           :string
#  short_summary :text
#  salary        :integer
#  company_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Job < ActiveRecord::Base
  has_many :events
  belongs_to :company
  serialize :pro
  serialize :con
end
