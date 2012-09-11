class AddTgzToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :tgz, :binary
  end

  def self.down
    remove_column :submissions, :tgz
  end
end
