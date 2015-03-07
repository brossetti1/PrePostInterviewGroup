class AddColumnsToCon < ActiveRecord::Migration
  def change
    create_table :cons do |t|
      t.integer :job_id
      t.string :con
    end
  end
end
