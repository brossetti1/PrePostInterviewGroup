class AddContactsTable < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :event_id
      t.integer :user_id        
      t.string  :first_name,   limit: 64  
      t.string  :last_name,    limit: 64  
      t.string  :title,        limit: 64  
      t.string  :email,        limit: 64  
      t.string  :phone,        limit: 32  
      t.string  :mobile,       limit: 32  
      t.boolean :do_not_call,  default: false
      t.string  :background_info, limit: 255
      t.timestamps 
    end
  end
end
