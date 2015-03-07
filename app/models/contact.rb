class Contact < ActiveRecord::Base
  has_many  :addresses, :dependent => :destroy, :as => :addressable, :class_name => "Address"
  belongs_to :event
  belongs_to :user
end



