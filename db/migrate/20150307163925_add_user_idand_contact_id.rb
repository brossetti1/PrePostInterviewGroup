class AddUserIdandContactId < ActiveRecord::Migration
  def change
    add_column :addresses, :user_id, :integer
    add_column :addresses, :contact_id, :integer
  end
end
