class AddVersionToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :version, :integer
  end

  def self.down
    remove_column :submissions, :version
  end
end
