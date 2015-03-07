# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  street1      :string
#  street2      :string
#  city         :string(64)
#  state        :string(64)
#  zipcode      :string(16)
#  full_address :string
#  created_at   :datetime
#  updated_at   :datetime
#  deleted_at   :datetime
#  user_id      :integer
#  contact_id   :integer
#  job_id       :integer

class Address < ActiveRecord::Base
  belongs_to :contact
  belongs_to :user
  belongs_to :job
end
