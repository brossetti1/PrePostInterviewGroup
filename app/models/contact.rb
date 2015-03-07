# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  event_id        :integer
#  user_id         :integer
#  first_name      :string(64)
#  last_name       :string(64)
#  title           :string(64)
#  email           :string(64)
#  phone           :string(32)
#  mobile          :string(32)
#  do_not_call     :boolean          default("f")
#  background_info :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Contact < ActiveRecord::Base
  has_many  :addresses, :dependent => :destroy
  belongs_to :event
  belongs_to :user
end



