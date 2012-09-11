class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.text :code
      t.integer :project_id, :null => false, :options =>
        "CONSTRAINT fk_submission_project REFERENCES projects(id)"
      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
