class AddInterviewDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :interview_date, :datetime
  end
end
