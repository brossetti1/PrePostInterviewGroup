class Job < ActiveRecord::Base
  has_many :events
  belongs_to :company
  serialize :pro
  serialize :con
end
