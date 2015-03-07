# == Schema Information
#
# Table name: cons
#
#  id     :integer          not null, primary key
#  job_id :integer
#  con    :string
#

class Con < ActiveRecord::Base
  belongs_to :job
end
