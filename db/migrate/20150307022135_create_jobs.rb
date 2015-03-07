class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :lead_source
      t.string :pro
      t.string :con
      t.text :short_summary
      t.integer :salary
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
