class AddFileNameToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :file_name, :string
  end

  def self.down
    remove_column :submissions, :file_name
  end
end
