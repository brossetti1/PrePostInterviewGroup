# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  job_id     :integer
#  url        :string
#

class Resume < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
end
