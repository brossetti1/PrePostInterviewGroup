class AddForeignKeysToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :user_id, :integer
    add_column :resumes, :job_id, :integer
    add_column :resumes, :url, :string
  end
end
