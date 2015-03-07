class AddColumnsToPro < ActiveRecord::Migration
  def change
    create_table :pros do |t|
      t.integer :job_id
      t.string :pro
    end
  end
end
