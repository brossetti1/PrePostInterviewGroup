# == Schema Information
#
# Table name: pros
#
#  id     :integer          not null, primary key
#  job_id :integer
#  pro    :string
#

class Pro < ActiveRecord::Base
  belongs_to :job
end
