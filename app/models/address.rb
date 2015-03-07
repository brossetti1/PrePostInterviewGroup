# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  street1          :string
#  street2          :string
#  city             :string(64)
#  state            :string(64)
#  zipcode          :string(16)
#  country          :string(64)
#  full_address     :string
#  addressable_id   :integer
#  addressable_type :string
#  created_at       :datetime
#  updated_at       :datetime
#  deleted_at       :datetime
#

class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
end
