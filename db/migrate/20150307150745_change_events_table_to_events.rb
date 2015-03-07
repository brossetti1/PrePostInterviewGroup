class ChangeEventsTableToEvents < ActiveRecord::Migration
  def change
    rename_table :events_tables, :events
  end
end
