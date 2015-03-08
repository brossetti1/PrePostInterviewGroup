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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
