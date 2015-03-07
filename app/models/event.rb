class Event < ActiveRecord::Base
  belongs_to :job
  has_many :contacts, :dependent => :destroy
  has_one :address, :dependent => :destroy, :as => :addressable, :class_name => "Address"
end
