class AddJobIdToAddressTable < ActiveRecord::Migration
  def change
    add_column :addresses, :job_id, :integer
  end
end
