class RemoveColumnFromTableJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :pro
    remove_column :jobs, :con
  end
end
